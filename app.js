var express = require('express'),
    path = require('path'),
    favicon = require('serve-favicon'),
    logger = require('morgan'),
    cookieParser = require('cookie-parser'),
    bodyParser = require('body-parser'),
    passport = require('passport'),
    session      = require('express-session');

var app = express();
require('./config/passport')(passport); // pass passport for configuration

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
// required for passport
app.use(session({ secret: 'q9v478ytnesptoe8wu5mnw4vwtyyor99yusmn5a3ov09uasv4tn' })); // session secret
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(require('less-middleware')(path.join(__dirname, 'public')));
app.use("/admin", express.static(path.join(__dirname, 'admin/dist')));
app.use(express.static(path.join(__dirname, 'public')));

require('./routes/index')(app, passport);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handlers

// error handler
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        error: err
    });
});

module.exports = app;
