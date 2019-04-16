// *********************************************************************************
// html-routes.js - this file offers a set of routes for sending users to the various html pages
// *********************************************************************************

// Dependencies
// =============================================================
var path = require("path");

// Routes
// =============================================================
module.exports = function(app) {

  // Each of the below routes just handles the HTML page that the user gets sent to.

  // index route loads view.html
  app.get("/", function(req, res) {
    res.sendFile(path.join(__dirname, "../public/index.html"));
  });

  // add-recipe route loads add-recipe.html
  app.get("/add-recipe", function(req, res) {
    res.sendFile(path.join(__dirname, "../public/add-recipe.html"));
  });

  // recipes route loads recipes.html
  app.get("/all-recipes", function(req, res) {
    res.sendFile(path.join(__dirname, "../public/all-recipes.html"));
  });

  // authors route loads author-manager.html
  app.get("/author-manager", function(req, res) {
    res.sendFile(path.join(__dirname, "../public/author-manager.html"));
  });

};
