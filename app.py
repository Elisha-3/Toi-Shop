from flask import*
import pymysql
from mpesa import*
from werkzeug.security import generate_password_hash, check_password_hash
app=Flask(__name__)
#session key
app.secret_key = "!#$@%^%$^%@&"
@app.route("/")
def Homepage():
    # establish connection to DB
    connection= pymysql.connect(host='kens.mysql.pythonanywhere-services.com',user='kens', password='@pgaDmin4#0',database='kens$Toi')
    sql = "SELECT * FROM products WHERE product_category = 'Essentials'"
    sql1 = "SELECT * FROM products WHERE product_category = 'Bags'"
    sql2 = "SELECT * FROM products WHERE product_category = 'Walkers'"
    sql3 = "SELECT * FROM products WHERE product_category = 'Feeders'"
    sql4 = "SELECT * FROM products WHERE product_category = 'Clothings'"
    sql5 = "SELECT * FROM products WHERE product_category = 'Fancy'"


    # execute the above querry
    # you need a cursor to execute it 
    cursor = connection.cursor()
    cursor1 = connection.cursor()
    cursor2 = connection.cursor()
    cursor3 = connection.cursor()
    cursor4 = connection.cursor()
    cursor5 = connection.cursor()


    # execute
    cursor.execute(sql)
    cursor1.execute(sql1)
    cursor2.execute(sql2)
    cursor3.execute(sql3)
    cursor4.execute(sql4)
    cursor5.execute(sql5)




    # get all the phones
    Essentials= cursor.fetchall()
    Bags= cursor1.fetchall()
    Walkers= cursor2.fetchall()
    Feeders= cursor3.fetchall()
    Clothings= cursor4.fetchall()
    Fancy = cursor5.fetchall()

    # cursor.close()
    # connection.close()

    return render_template("index.html", Essentials = Essentials, Bags= Bags, Walkers= Walkers, Feeders=Feeders, Clothings=Clothings, Fancy=Fancy)

#route for a single product
@app.route("/single/<product_id>")
def Singleitem(product_id):
    connection= pymysql.connect(host='kens.mysql.pythonanywhere-services.com',user='kens', password='@pgaDmin4#0',database='kens$Toi')
    #create SQL query
    sql = "SELECT * FROM products WHERE product_id = %s "
    #create a cursor
    cursor = connection.cursor()
    #execute
    cursor.execute(sql,product_id)
    #get singleproduct
    product= cursor.fetchone()

    return render_template("single.html", product= product )

@app.route("/login", methods=['POST', 'GET'])
def Login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        # Connect to DB
        connection = pymysql.connect(host='kens.mysql.pythonanywhere-services.com', user='kens', password='@pgaDmin4#0', database='kens$Toi')
        cursor = connection.cursor()

        # Check if user exists in the DB
        sql = "SELECT * FROM users WHERE email = %s AND password = %s"
        cursor.execute(sql, (email, password))

        # Check if any result found
        user = cursor.fetchone()
        if user:
            role = user[5]  # Assuming the role is in the sixth column
            session['key'] = email
            session['admin'] = role  # Store user role in session

            return redirect("/")
        else:
            return render_template("login.html", error="Invalid login credentials")

    return render_template("login.html")


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
        product_image_name.save('static/images/' + product_image_name.filename)

        # Connect to DB
        connection = pymysql.connect(host='kens.mysql.pythonanywhere-services.com', user='kens', password='@pgaDmin4#0', database='kens$Toi')
        cursor = connection.cursor()

        sql = "INSERT INTO products(product_name, product_desc, product_cost, product_category, product_image_name) values (%s, %s, %s, %s, %s)"
        data = (product_name, product_desc, product_cost, product_category, product_image_name.filename)
        cursor.execute(sql, data)
        connection.commit()

        return render_template("upload.html", message="Product added successfully")

    return render_template("upload.html", error="Please add a product")


@app.route("/fashion")
def fashion():
    # establish connection to DB
    connection= pymysql.connect(host='kens.mysql.pythonanywhere-services.com',user='kens', password='@pgaDmin4#0',database='kens$Toi')
    sql = "SELECT * FROM products WHERE product_category = 'cots'"
    sql1 = "SELECT * FROM products WHERE product_category = 'containers'"
    sql2 = "SELECT * FROM products WHERE product_category = 'shoes'"
    sql3 = "SELECT * FROM products WHERE product_category = 'sandals'"
    sql4 = "SELECT * FROM products WHERE product_category = 'moms'"
    sql5 = "SELECT * FROM products WHERE product_category = 'shops'"


    # execute the above querry
    # you need a cursor to execute it 
    cursor = connection.cursor()
    cursor1 = connection.cursor()
    cursor2 = connection.cursor()
    cursor3 = connection.cursor()
    cursor4 = connection.cursor()
    cursor5 = connection.cursor()


    # execute
    cursor.execute(sql)
    cursor1.execute(sql1)
    cursor2.execute(sql2)
    cursor3.execute(sql3)
    cursor4.execute(sql4)
    cursor5.execute(sql5)


    # get all the phones
    cots= cursor.fetchall()
    containers= cursor1.fetchall()
    shoes= cursor2.fetchall()
    sandals= cursor3.fetchall()
    moms= cursor4.fetchall()
    shops = cursor5.fetchall()

    return render_template("fashion.html",cots=cots, containers=containers, shoes=shoes, sandals=sandals, moms=moms, shops=shops)

# a route to upload fashion

@app.route("/uploadfashion", methods=['POST', 'GET'])
def UploadFashion():
    if 'admin' not in session or session['admin'] != 'admin':
        return render_template("login.html", error="You do not have access to this page.")

    if request.method == 'POST':
        product_name = request.form['product_name']
        product_desc = request.form['product_desc']
        product_cost = request.form['product_cost']
        fashion_category = request.form['product_category']
        product_image_name = request.files['product_image_name']
        product_image_name.save('static/images/' + product_image_name.filename)

        # Connect to DB
        connection = pymysql.connect(host='kens.mysql.pythonanywhere-services.com', user='kens', password='@pgaDmin4#0', database='kens$Toi')
        cursor = connection.cursor()

        sql = "INSERT INTO products(product_name, product_desc, product_cost, product_category, product_image_name) values (%s, %s, %s, %s, %s)"
        data = (product_name, product_desc, product_cost, fashion_category, product_image_name.filename)
        cursor.execute(sql, data)
        connection.commit()

        return render_template("uploadfashion.html", message="Fashion added successfully")

    return render_template("uploadfashion.html", error="Please add a fashion")


@app.route("/about")
def About():
    return "This is about"

@app.route("/register", methods=['POST','GET'])
def Register():
    if request.method=='POST':
        # user can add the products
        username = request.form['username']
        email = request.form['email']
        role = request.form['role']
        phone = request.form['phone']
        password = request.form['password']
        
        #hashed security
        #hashed_password = generate_password_hash(password, method= 'sha256', salt_length=int=16)
        # connect to DB
        connection= pymysql.connect(host='kens.mysql.pythonanywhere-services.com',user='kens', password='@pgaDmin4#0',database='kens$Toi')

        # create a cursor 
        cursor = connection.cursor()

        sql = "INSERT INTO users(username, email, role, phone, password) values (%s, %s, %s, %s,%s)"

        #provide the data
        data = (username, email, role, phone, password)
        # execute
        cursor.execute(sql, data)
        # save changes
        connection.commit()

        return render_template("register.html", message= "user registered successfully")

    else:
      return render_template("register.html", error = "Please add a user")
    
#Mpesa
    # implent STK PUSH 
@app.route("/mpesa", methods=['POST'])
def mpesa():
    phone= request.form["phone"]
    amount = request.form["amount"]

    # use mpesa_payment function from mpesa.py
    # it accepts the phone and amount as arguments
    mpesa_payment(amount,phone)
    return '<h1> Please complete payment in your phone</h1>' \
    '<a href="/" class= "btn btn-outline-muted btn-sm"> Back to Products</a>'

@app.route("/logout")
def Logout():
    session.clear()

    return redirect("/login")

if __name__ == '__main__':
    app.run(debug=True, port=4003)