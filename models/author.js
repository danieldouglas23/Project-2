module.exports = function(sequelize, DataTypes) {
    var Author = sequelize.define("Author", {
      // Giving the Author model a name of type STRING
      name: DataTypes.STRING
    });
  
    Author.associate = function(models) {
      // Associating Author with Recipes
      // When an Author is deleted, also delete any associated Recipes
      Author.hasMany(models.Recipe, {
        onDelete: "cascade"
      });
    };
  
    return Author;
  };