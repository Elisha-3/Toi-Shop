# 🛍️ Toi Shop - E-Commerce Web Application

![Toi Shop Banner](image-url-here)
     <img src="screenshot/Capture.png"/>
**Toi Shop** is a simple and intuitive e-commerce application built with Flask. Users can browse products, manage their shopping cart, and make payments via Mpesa. Admins have a powerful dashboard for managing products and viewing statistics.

## 🚀 Features

### 🛒 User Features
- **Browse Products:** Explore a variety of categories (Essentials, Bags, Walkers, etc.).
- **Product Details:** View detailed information about each product.
- **Shopping Cart:** Add items, view your cart, and proceed to checkout.
- **User Authentication:** Register and log in securely.
- **Mpesa Integration:** Make payments conveniently via Mpesa.

### 🛠️ Admin Features
- **Dashboard:** Manage products and view key statistics (active/deleted products, users).
- **CRUD Operations:** Add new products, edit existing ones, and soft delete or restore products.
- **Analytics:** View total users and sales statistics.

## 🛑 Technologies Used

### Backend
- **Python 3.x** with **Flask** framework
- **MySQL** database (via `pymysql` connector)
- **Werkzeug** for secure password hashing

### Frontend
- **HTML5**, **CSS3**, and **Bootstrap** for responsive design
- **Jinja2** templating engine integrated with Flask

### Payment Gateway
- **Mpesa API** for secure payment processing

## 📦 Installation

### Prerequisites
Ensure you have the following installed:
- Python 3.x
- MySQL server
- pip (Python package manager)

### Setup Instructions
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Elisha-3/Toi-Shop.git
   cd Toi-Shop
