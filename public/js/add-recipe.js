$(document).ready(function() {
  // Getting jQuery references to the recipe title, ingredients, preparation, image_link, servings, form, and author select
  var titleInput = $("#title");
  var ingredientsInput = $("#ingredients");
  var preparationInput = $("#preparation");
  var image_linkInput = $("#image_link");
  var servingsInput = $("#servings");
  var addRecipeForm = $("#add-recipe");
  var authorSelect = $("#author");
  // Adding an event listener for when the form is submitted
  $(addRecipeForm).on("submit", handleFormSubmit);
  // Gets the part of the url that comes after the "?" (which we have if we're updating a recipe)
  var url = window.location.search;
  var recipeId;
  var authorId;
  // Sets a flag for whether or not we're updating a recipe to be false initially
  var updating = false;

  // If we have this section in our url, we pull out the recipe id from the url
  // In '?recipe_id=1', recipeId is 1
  if (url.indexOf("?recipe_id=") !== -1) {
    recipeId = url.split("=")[1];
    getRecipeData(recipeId, "recipe");
  }
  // Otherwise if we have an author_id in our url, preset the author select box to be our Author
  else if (url.indexOf("?author_id=") !== -1) {
    authorId = url.split("=")[1];
  }

  // Getting the authors, and their recipes
  getAuthors();

  // A function for handling what happens when the form to create a new recipe is submitted
  function handleFormSubmit(event) {
    event.preventDefault();
    // Wont submit the recipe if we are missing a body, title, or author
    if (!titleInput.val().trim() || !ingredientsInput.val().trim() || !preparationInput.val().trim() || !image_linkInput.val().trim() || !servingsInput.val().trim() || !authorSelect.val()) {
      return;
    }
    // Constructing a newRecipe object to hand to the database
    var newRecipe = {
      title: titleInput
        .val()
        .trim(),
      ingredients: ingredientsInput
        .val()
        .trim(),
      preparation: preparationInput
        .val()
        .trim(),
      image_link: image_linkInput
        .val()
        .trim(),
      servings: servingsInput
        .val()
        .trim(),
      AuthorId: authorSelect.val()
    };

    // If we're updating a recipe run updateRecipe to update a recipe
    // Otherwise run submitRecipe to create a whole new recipe
    if (updating) {
      newRecipe.id = recipeId;
      updateRecipe(newRecipe);
    }
    else {
      submitRecipe(newRecipe);
    }
  }

  // Submits a new recipe and brings user to recipes page upon completion
  function submitRecipe(recipe) {
    $.post("/api/recipes", recipe, function() {
      window.location.href = "/all-recipes";
    });
  }

  // Gets recipe data for the current recipe if we're editing, or if we're adding to an author's existing recipes
  function getRecipeData(id, type) {
    var queryUrl;
    switch (type) {
      case "recipe":
      queryUrl = "/api/recipes/" + id;
      break;
    case "author":
      queryUrl = "/api/authors/" + id;
      break;
    default:
      return;
    }
    $.get(queryUrl, function(data) {
      if (data) {
        console.log(data.AuthorId || data.id);
        // If this recipe exists, prefill our add-recipe forms with its data
        titleInput.val(data.title);
        ingredientsInput.val(data.ingredients);
        preparationInput.val(data.preparation);
        image_linkInput.val(data.image_link);  
        servingsInput.val(data.servings);     
        authorId = data.AuthorId || data.id;
        // If we have a recipe with this id, set a flag for us to know to update the recipe
        // when we hit submit
        updating = true;
      }
    });
  }

  // A function to get Authors and then render our list of Authors
  function getAuthors() {
    $.get("/api/authors", renderAuthorList);
  }
  // Function to either render a list of authors, or if there are none, direct the user to the page
  // to create an author first
  function renderAuthorList(data) {
    if (!data.length) {
      window.location.href = "/authors";
    }
    $(".hidden").removeClass("hidden");
    var rowsToAdd = [];
    for (var i = 0; i < data.length; i++) {
      rowsToAdd.push(createAuthorRow(data[i]));
    }
    authorSelect.empty();
    console.log(rowsToAdd);
    console.log(authorSelect);
    authorSelect.append(rowsToAdd);
    authorSelect.val(authorId);
  }

  // Creates the author options in the dropdown
  function createAuthorRow(author) {
    var listOption = $("<option>");
    listOption.attr("value", author.id);
    listOption.text(author.name);
    return listOption;
  }

  // Update a given recipe, bring user to the recipes page when done
  function updateRecipe(recipe) {
    $.ajax({
      method: "PUT",
      url: "/api/recipes",
      data: recipe
    })
      .then(function() {
        window.location.href = "/all-recipes";
      });
  }
});
