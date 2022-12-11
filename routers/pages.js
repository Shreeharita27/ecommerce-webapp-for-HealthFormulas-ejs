const express = require('express')
const path = require('path')
const route = express.Router()
let db = require('../database/config');
const bodyParser=require('body-parser')
var urlencodedParser=bodyParser.urlencoded({extended:false})

route.get('/', (req, res) => {
    res.render('login', {title: 'Login'});
})
route.get('/home', (req, res) => {
    res.render('login', {title: 'Login'});
})


route.post('/login-check', urlencodedParser, function(request, response) {
	var email = request.body.email;
	var password = request.body.password;
	if (email && password) {
		db.query("SELECT * FROM users WHERE email = '"+email+"' AND password = '"+password+"'", function(error, results, fields) {
			        console.log(email);
            if (results.length>0) {
				// request.session.loggedin = true;
				// request.session.username = username;
				response.redirect('/shop');
			} else {
				response.send('Invalid Credentials!');
			}			
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});

route.post('/register-user', urlencodedParser, function(request, response) {
	var email = request.body.email;
	var password = request.body.password;
	if (email && password) {
		db.query("Insert into users (email, password) values ('"+email+"','"+password+"');", function(error, results, fields) {
			response.redirect('/shop');			
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});

route.get('/about', (req, res) => {
    res.render('about', {title:"About"});
})
    
route.get('/register', (req, res) =>{
    res.render('register', {title: 'Register'});
})


route.get('/shop', function(req, res) {
    let products;
    db.query("SELECT * FROM products left join categories on categories.id=products.category", function (err, result, fields) {
      if (err) {
        throw err;
      } else {
        //console.log(result);
        res.render('products', {title: 'Shop', products: result});
      }
    });
  }); 

  route.get('/product/:product', function(req, res) {
    let products;
    db.query("SELECT * FROM products left join categories on categories.id=products.category where pid='"+req.params.product+"'", function (err, result, fields) {
      if (err) {
        throw err;
      } else {
        //console.log(result);
        res.render('product', {title: 'Product', products: result});
      }
    });
  });
  


  route.get('/add-to-cart/:product', function(req, res) {
    
    let product = req.params.product.split("-")[1];

    let products = [];
    if(req.cookies.products_cart) {
      products = req.cookies.products_cart;
    }

    db.query("SELECT * FROM products left join categories on categories.id=products.category where pid='"+product+"'", function (err, result, fields) {
      if (err) {
        console.log(err)
        res.render('page', {title: 'About'});
      } else {
        let flag = 0;
        products.forEach(item => {
          if(item.pid == product) {
            flag = 1;
          }
        });
        //console.log(result);
        if(flag == 0) {
          products.push({
            pid: result[0].pid,
            title: result[0].title,
            name: result[0].name,
            price: result[0].price,
            picture: result[0].picture,
            qnt: 1
          });
        }
        res.cookie('products_cart', products, {path:'/'});
        res.redirect('/cart');
      }
    });
  });
  

route.get('/cart', function(req, res) {
    let products = [];
    if(req.cookies.products_cart) {
      res.render('cart', {title: 'Cart', products: req.cookies.products_cart, i:0});
    } else {
      res.render('cart', {title: 'Cart', products: products, i:0});
    }
});


route.get('/remove-from-cart/:index', function(req, res) {
    let products = req.cookies.products_cart;
    let index = req.params.index.split("-")[1];
    products.splice(index, 1);
    res.cookie('products_cart', products, {path:'/'});
    
    res.redirect('/cart');
  });
  
  route.get('/empty-cart', function(req, res) {
    let products = [];
    res.cookie('products_cart', products, {path:'/'});
    
    res.redirect('/cart');
  });
  

  route.post('/update-cart', urlencodedParser, function(req, res) {
    //console.log(req.cookies.products_cart);
    let products = req.cookies.products_cart;
    let i=0;
    products.forEach(function(product, index) {
        // let qnt='qnt'+i;
      product.qnt = req.body.qnt[index];
      i++;
    });
    //console.log(req.body)
    res.clearCookie('products_cart', {path:'/'});
    res.cookie('products_cart', products);
    res.redirect('/cart');
  });
  
  route.get('/checkout', function(req, res) {
    //res.send('<h1>About page</h1>');
    res.render('order', {title: 'Checkout'});
  });
  
  
  route.get('/contact', function(req, res) {
    res.render('page', {title: 'Contact'});
  });
  
  route.post('/final',urlencodedParser, function(req, res) {
    // let info=req.body.name;
    res.render('invoice', {title: 'Cart', products: req.cookies.products_cart, sum:0, info:req.body});
  });
  

module.exports = route;

