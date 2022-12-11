# ecommerce-webapp-for-HealthFormulas-ejs
An ecommerce website for a company that sells health products using ejs

1. Problem Statement: 
Healthformulas is online health and Supplement Company. Here a user can register and login into his account. The user details are stored in database. User can view health and supplement products, see the description, details and price. The user can add the products to cart; order products .The invoice must be displayed.

2. Framework Chosen: 
Node.js is a platform for building the i/o applications which are server-side event-driven and made using JavaScript.
To connect node.js and MySQL we used express library.  Express is a small framework that sits on top of Node.js's web server functionality to simplify its APIs and add helpful new features.

3. Methodology adopted:
    • Frontend created using express js.

    • We have used CSS for styling the web page.

    • Backend is created using Nodejs(mysql).

    • User can register and login into his account

    • The user details are stored in database(mysql). 

    • User can view health and supplement products, see the description, details and price in products web page


4. UI and Database Design
1)Login or Home page:
![image](https://user-images.githubusercontent.com/59958361/206913164-6982eb66-7d14-4efc-8f65-3a46a13eaebc.png)
2)Registration Page:
![image](https://user-images.githubusercontent.com/59958361/206913234-b6dc9e3d-a52c-44d4-95ef-09580d86ea4e.png)
3)Products page:
![image](https://user-images.githubusercontent.com/59958361/206913266-485479c0-f0b0-4825-a9af-d727f40f6c19.png)
4)Cart page:
![image](https://user-images.githubusercontent.com/59958361/206913282-41791f74-172f-4951-9454-fec2837a17bb.png)
5)Checkout page
![image](https://user-images.githubusercontent.com/59958361/206913318-234b695c-3247-422b-8507-0c4618eb640f.png)
6)Invoice:
![image](https://user-images.githubusercontent.com/59958361/206913344-0ba99de2-4397-47bd-96d6-27a63944871a.png)


Database Design:

Database name: Healthformulas

There are 3 tables:

• User table to store user details like Name, Email, Address, City, State, Country.

• Products table to store details like product id, product name, price, link to the product picture.

• Categories table to store the category id, and category name under which the products lie.
