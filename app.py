from flask import *
import pymysql
from mpesa import *
from werkzeug.security import generate_password_hash, check_password_hash
import os
import logging
from itsdangerous import URLSafeTimedSerializer
from flask_mail import Mail, Message


app = Flask(__name__)
app.secret_key = "!#$@%^%$^%@&"


# Email configuration for Flask-Mail
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = os.getenv('MAIL_USERNAME')
app.config['MAIL_PASSWORD'] = os.getenv('MAIL_PASSWORD')

mail = Mail(app)
s = URLSafeTimedSerializer(app.secret_key)

if not app.debug:
    logging.basicConfig(level=logging.ERROR)
    handler = logging.StreamHandler()
    handler.setLevel(logging.ERROR)
    app.logger.addHandler(handler)

# Database connection function
def get_db_connection():
    return pymysql.connect(
        host=os.getenv("DB_HOST", "bwqnks3sld1ixh10supl-mysql.services.clever-cloud.com"),
        user=os.getenv("DB_USER", "uwiaqvhttqj3ovt1"),
        password=os.getenv("DB_PASSWORD", "5WIlrvqIT6HOxyyoL0gT"),
        database=os.getenv("DB_NAME", "bwqnks3sld1ixh10supl"),
        connect_timeout=10 
    )

# Home route
@app.route("/")
def homepage():
    connection = get_db_connection()
    try:
        queries = {
            "Essentials": "SELECT * FROM products WHERE product_category = 'Essentials'",
            "Bags": "SELECT * FROM products WHERE product_category = 'Bags'",
            "Walkers": "SELECT * FROM products WHERE product_category = 'Walkers'",
            "Feeders": "SELECT * FROM products WHERE product_category = 'Feeders'",
            "Clothings": "SELECT * FROM products WHERE product_category = 'Clothings'",
            "Fancy": "SELECT * FROM products WHERE product_category = 'Fancy'"
        }
        categories = {}
        with connection.cursor() as cursor:
            for category, query in queries.items():
                cursor.execute(query)
                categories[category] = cursor.fetchall()
    finally:
        connection.close()
    return render_template("index.html", **categories)

# Single product route
@app.route("/single/<int:product_id>")
def single_item(product_id):
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Fetch the selected product details
            cursor.execute("SELECT * FROM products WHERE product_id = %s", (product_id,))
            product = cursor.fetchone()

            # Fetch similar products based on the category (e.g., product[4] is the category)
            # cursor.execute("SELECT * FROM products WHERE category = %s AND product_id != %s LIMIT 4", (product[4], product_id))
            cursor.execute("SELECT * FROM products WHERE product_category = %s AND product_id != %s LIMIT 4", (product[4], product_id))

            similar_products = cursor.fetchall()

    finally:
        connection.close()

    # Pass both product and similar_products to the template
    return render_template("single.html", product=product, similar_products=similar_products)


# Login route
@app.route("/login", methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        connection = get_db_connection()
        try:
            with connection.cursor() as cursor:
                cursor.execute("SELECT * FROM users WHERE email = %s AND password = %s", (email, password))
                user = cursor.fetchone()
                
                if user:  # Login successful
                    session['key'] = email
                    session['admin'] = user[5]  # Assuming role is in the sixth column
                    return redirect("/admin")
                else:
                    return render_template("login.html", error="Invalid login credentials")
        finally:
            connection.close()
    return render_template("login.html")

#forgot password route
@app.route("/forgot-password", methods=['GET', 'POST'])
def forgot_password():
    if request.method == 'POST':
        email = request.form['email']

        # Get database connection
        connection = get_db_connection()
        if not connection:
            return render_template("forgot_password.html", error="Database connection failed. Please try again later.")

        try:
            with connection.cursor() as cursor:
                # Check if the email exists
                sql = "SELECT * FROM users WHERE email = %s"
                cursor.execute(sql, (email,))
                user = cursor.fetchone()

                if not user:
                    return render_template("forgot_password.html", error="Email not found. Please check and try again.")

                # Generate a password reset token
                token = s.dumps(email, salt='password-reset-salt')

                # Create a password reset link
                reset_url = url_for('reset_password', token=token, _external=True)

                # Send the password reset email
                msg = Message("Password Reset Request",
                              sender=app.config['MAIL_USERNAME'],
                              recipients=[email])
                msg.body = f"Please click the link to reset your password: {reset_url}"
                mail.send(msg)

                return render_template("forgot_password.html", message="Password reset link sent to your email.")
        except Exception as e:
            app.logger.error(f"Error during forgot password process: {e}")
            return render_template("forgot_password.html", error="An error occurred. Please try again.")
        finally:
            connection.close()
    return render_template("forgot_password.html")

#reset password route
@app.route("/reset-password/<token>", methods=['GET', 'POST'])
def reset_password(token):
    try:
        email = s.loads(token, salt='password-reset-salt', max_age=3600)  # Token expires after 1 hour
    except Exception:
        return render_template("reset_password.html", error="The reset link is invalid or has expired.")

    if request.method == 'POST':
        new_password = request.form['password']

        # Hash the new password
        hashed_password = generate_password_hash(new_password)

        # Update the password in the database
        connection = get_db_connection()
        if not connection:
            return render_template("reset_password.html", error="Database connection failed. Please try again later.")

        try:
            with connection.cursor() as cursor:
                sql = "UPDATE users SET password = %s WHERE email = %s"
                cursor.execute(sql, (hashed_password, email))
            connection.commit()
            return redirect(url_for('login', message="Password reset successful. Please log in."))
        except Exception as e:
            app.logger.error(f"Error during password reset: {e}")
            return render_template("reset_password.html", error="An error occurred. Please try again.")
        finally:
            connection.close()
    return render_template("reset_password.html")

# Register route
@app.route("/register", methods=['POST', 'GET'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        phone = request.form['phone']
        password = request.form['password']
        
        # Get database connection
        connection = get_db_connection()
        if not connection:
            return render_template("register.html", error="Database connection failed. Please try again later.")

        try:
            with connection.cursor() as cursor:
                # Check if the user already exists (by email)
                check_sql = "SELECT * FROM users WHERE email = %s"
                cursor.execute(check_sql, (email,))
                existing_user = cursor.fetchone()

                if existing_user:
                    return render_template("register.html", error="Email already registered. Please use a different email.")

                # Insert the new user into the database
                sql = "INSERT INTO users (username, email, phone, password) VALUES (%s, %s, %s, %s)"
                cursor.execute(sql, (username, email, phone, password))
            connection.commit()
            return render_template("register.html", message="User registered successfully")
        except Exception as e:
            app.logger.error(f"Error during registration: {e}")
            return render_template("register.html", error="An error occurred while registering. Please try again.")
        finally:
            connection.close()
    return render_template("register.html", error="Please fill out the form to register.")


@app.route("/fashion")
def fashion():
    connection = get_db_connection()
    try:
        queries = {
            "cots": "SELECT * FROM products WHERE product_category = 'cots'",
            "containers": "SELECT * FROM products WHERE product_category = 'containers'",
            "shoes": "SELECT * FROM products WHERE product_category = 'shoes'",
            "sandals": "SELECT * FROM products WHERE product_category = 'sandals'",
            "moms": "SELECT * FROM products WHERE product_category = 'moms'",
            "shops": "SELECT * FROM products WHERE product_category = 'shops'"
        }
        categories = {}
        with connection.cursor() as cursor:
            for category, query in queries.items():
                cursor.execute(query)
                categories[category] = cursor.fetchall()
    finally:
        connection.close()

    return render_template("fashion.html", **categories)

@app.route('/add_to_cart/<int:product_id>', methods=['POST'])
def add_to_cart(product_id):
    cart = session.get('cart', {})
    cart[product_id] = cart.get(product_id, 0) + 1
    session['cart'] = cart
    session['cart_count'] = sum(cart.values())
    session.modified = True

    return jsonify(cart_count=session['cart_count'])

# View cart route
@app.route('/cart')
def cart():
    cart_items = session.get('cart', {})
    products = []
    if cart_items:
        connection = get_db_connection()
        try:
            placeholders = ', '.join(['%s'] * len(cart_items))
            query = f"SELECT * FROM products WHERE product_id IN ({placeholders})"
            with connection.cursor() as cursor:
                cursor.execute(query, tuple(cart_items.keys()))
                products = cursor.fetchall()
        finally:
            connection.close()
    return render_template('cart.html', cart=products, quantities=cart_items)

# Checkout route
@app.route('/checkout')
def checkout():
    if 'cart' in session:
        session.pop('cart')
        return render_template('checkout.html', success=True)
    return redirect('/cart')

# Logout route
@app.route("/logout")
def logout():
    session.clear()
    return redirect("/login")

@app.route("/admin")
def admin_dashboard():
    if 'admin' not in session or session['admin'] != 'admin':
        return redirect('/login')
    
    connection = get_db_connection()
    try:
        cursor = connection.cursor()
        
        # Fetch active products
        cursor.execute("SELECT product_id, product_name, product_cost FROM products WHERE is_deleted = FALSE")
        products = cursor.fetchall()

        # Fetch deleted products
        cursor.execute("SELECT product_id, product_name, product_cost FROM products WHERE is_deleted = TRUE")
        deleted_products = cursor.fetchall()

        # Fetch other dashboard data
        cursor.execute("SELECT username FROM users")
        users = cursor.fetchall()

        cursor.execute("SELECT COUNT(*) FROM users")
        total_users = cursor.fetchone()[0]

        cursor.execute("SELECT SUM(product_cost) FROM purchases")
        total_sales = cursor.fetchone()[0] or 0
    finally:
        connection.close()

    return render_template("admindashboard.html", products=products, deleted_products=deleted_products, users=users, analytics={'total_users': total_users, 'total_sales': total_sales})


# Route to upload new products
@app.route("/upload", methods=['POST', 'GET'])
def Upload():
    if 'admin' not in session or session['admin'] != 'admin':
        return render_template("login.html", error="You do not have access to this page.")

    if request.method == 'POST':
        product_name = request.form['product_name']
        product_desc = request.form['product_desc']
        product_cost = request.form['product_cost']
        product_category = request.form['product_category']
        product_image_name = request.files['product_image_name']
        product_image_name.save(f'static/images/{product_image_name.filename}')
        
        connection = get_db_connection()
        cursor = connection.cursor()
        sql = "INSERT INTO products(product_name, product_desc, product_cost, product_category, product_image_name) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(sql, (product_name, product_desc, product_cost, product_category, product_image_name.filename))
        connection.commit()
        cursor.close()
        connection.close()
        
        return render_template("upload.html", message="Product added successfully")
    
    return render_template("upload.html", error="Please add a product")

# Route to upload fashion products
@app.route("/uploadfashion", methods=['POST', 'GET'])
def upload_fashion():
    # Ensure only admin users can access this page
    if 'admin' not in session or session['admin'] != 'admin':
        return render_template("login.html", error="You do not have access to this page.")

    if request.method == 'POST':
        # Get form data
        product_name = request.form['product_name']
        product_desc = request.form['product_desc']
        product_cost = request.form['product_cost']
        
        # Set the category to 'Fashion' automatically
        product_category = 'Fashion'
        
        # Handle the image upload
        product_image = request.files['product_image']
        if product_image:
            # Save the image to the static/images directory
            image_path = f'static/images/{product_image.filename}'
            product_image.save(image_path)
        
        # Connect to the database and insert the fashion product
        connection = get_db_connection()
        cursor = connection.cursor()
        sql = "INSERT INTO products (product_name, product_desc, product_cost, product_category, product_image_name) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(sql, (product_name, product_desc, product_cost, product_category, product_image.filename))
        connection.commit()
        
        # Clean up database connections
        cursor.close()
        connection.close()
        
        return render_template("uploadfashion.html", message="Fashion product added successfully")
    
    return render_template("uploadfashion.html", error="Please add a fashion product")


# Route to soft delete a product
@app.route("/soft_delete_product/<int:product_id>")
def soft_delete_product(product_id):
    if 'admin' not in session or session['admin'] != 'admin':
        return redirect('/login')

    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            cursor.execute("UPDATE products SET is_deleted = TRUE WHERE product_id = %s", (product_id,))
        connection.commit()
    finally:
        connection.close()
    
    return redirect('/admin')

# Route to restore a deleted product
@app.route("/restore_product/<int:product_id>")
def restore_product(product_id):
    if 'admin' not in session or session['admin'] != 'admin':
        return redirect('/login')

    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Update the product to set it as not deleted
            cursor.execute("UPDATE products SET is_deleted = FALSE WHERE product_id = %s", (product_id,))
        connection.commit()
    finally:
        connection.close()
    return redirect('/admin')



#Mpesa
    # implent STK PUSH 
@app.route("/mpesa", methods=['POST'])
def mpesa():
    phone= request.form["phone"]
    amount = request.form["amount"]

    # use mpesa_payment function from mpesa.py
    # it accepts the phone and amount as arguments
    mpesa_payment(amount,phone)
    return '<h1> Please complete payment in your phone</h1>'\
        '<a href="/" class= "btn btn-outline-muted btn-sm"> Back to Products</a>'

if __name__ == '__main__':
    app.run(debug=False, port=4003)