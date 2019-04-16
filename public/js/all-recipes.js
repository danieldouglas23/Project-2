$(document).ready(function() {
    /* global moment */
  
    // recipeContainer holds all of our recipess
    var recipeContainer = $(".recipe-container");
    var recipeCategorySelect = $("#category");
    // Click events for the edit and delete buttons
    $(document).on("click", "button.delete", handleRecipeDelete);
    $(document).on("click", "button.edit", handleRecipeEdit);
    // Variable to hold our recipes
    var recipes;
  
    // The code below handles the case where we want to get recipes for a specific author
    // Looks for a query param in the url for author_id
    var url = window.location.search;
    var authorId;
    if (url.indexOf("?author_id=") !== -1) {
      authorId = url.split("=")[1];
      getRecipes(authorId);
    }
    // If there's no authorId we just get all recipes as usual
    else {
      getRecipes();
    }
  
  
    // This function grabs recipes from the database and updates the view
    function getRecipes(author) {
      authorId = author || "";
      if (authorId) {
        authorId = "/?author_id=" + authorId;
      }
      $.get("/api/recipes" + authorId, function(data) {
        console.log("Recipes", data);
        recipes = data;
        if (!recipes || !recipes.length) {
          displayEmpty(author);
        }
        else {
          initializeRows();
        }
      });
    }
  
    // This function does an API call to delete recipes
    function deleteRecipe(id) {
      $.ajax({
        method: "DELETE",
        url: "/api/recipes/" + id
      })
        .then(function() {
          getRecipes(recipeCategorySelect.val());
        });
    }
  
    // InitializeRows handles appending all of our constructed recipe HTML inside recipeContainer
    function initializeRows() {
      recipeContainer.empty();
      var recipesToAdd = [];
      for (var i = 0; i < recipes.length; i++) {
        recipesToAdd.push(createNewRow(recipes[i]));
      }
      recipeContainer.append(recipesToAdd);
    }
  
    // This function constructs a recipe's HTML
    function createNewRow(recipe) {
      var formattedDate = new Date(recipe.createdAt);
      formattedDate = moment(formattedDate).format("MMMM Do YYYY, h:mm:ss a");
      var newRecipeCard = $("<div>");
      newRecipeCard.addClass("card");
      var newRecipeCardHeading = $("<div>");
      newRecipeCardHeading.addClass("card-header");
      var deleteBtn = $("<button>");
      deleteBtn.text("x");
      deleteBtn.addClass("delete btn btn-danger");
      var editBtn = $("<button>");
      editBtn.text("EDIT");
      editBtn.addClass("edit btn btn-info");
      var newRecipeTitle = $("<h2>");
      var newRecipeDate = $("<small>");
      var newRecipeAuthor = $("<h5>");
      newRecipeAuthor.text("Written by: " + recipe.Author.name);
      newRecipeAuthor.css({
        float: "right",
        color: "blue",
        "margin-top":
        "-10px"
      });
      var newRecipeCardBody = $("<div>");
      newRecipeCardBody.addClass("card-body");
      var newRecipeBody = $("<p>");
      newRecipeTitle.text(recipe.title + " ");
      newRecipeBody.text(recipe.body);
      newRecipeDate.text(formattedDate);
      newRecipeTitle.append(newRecipeDate);
      newRecipeCardHeading.append(deleteBtn);
      newRecipeCardHeading.append(editBtn);
      newRecipeCardHeading.append(newRecipeTitle);
      newRecipeCardHeading.append(newRecipeAuthor);
      newRecipeCardBody.append(newRecipeBody);
      newRecipeCard.append(newRecipeCardHeading);
      newRecipeCard.append(newRecipeCardBody);
      newRecipeCard.data("recipe", recipe);
      return newRecipeCard;
    }
  
    // This function figures out which recipe we want to delete and then calls deleteRecipe
    function handleRecipeDelete() {
      var currentRecipe = $(this)
        .parent()
        .parent()
        .data("recipe");
      deleteRecipe(currentRecipe.id);
    }
  
    // This function figures out which recipe we want to edit and takes it to the appropriate url
    function handleRecipeEdit() {
      var currentRecipe = $(this)
        .parent()
        .parent()
        .data("recipe");
      window.location.href = "/add-recipe?recipe_id=" + currentRecipe.id;
    }
  
    // This function displays a message when there are no recipes
    function displayEmpty(id) {
      var query = window.location.search;
      var partial = "";
      if (id) {
        partial = " for Author #" + id;
      }
      recipeContainer.empty();
      var messageH2 = $("<h2>");
      messageH2.css({ "text-align": "center", "margin-top": "50px" });
      messageH2.html("No recipes yet" + partial + ", navigate <a href='/all-recipes" + query +
      "'>here</a> in order to get started.");
      recipeContainer.append(messageH2);
    }
  
  });