const express = require('express')
const path = require('path')
const cookieParser = require('cookie-parser');
const app = express()
const port = 9000
app.set('view engine', 'ejs');
app.set('views', 'views'); 
app.locals.siteTitle = 'HealthFormulas'; 


app.use(cookieParser());
app.use(express.static("public"))
app.use(require('./routers/pages.js'))

const bodyParser = require('body-parser');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: false })); // support encoded bodies

app.listen(port, () => {
  console.log(`listening on port ${port}`)
})