module.exports = function(sequelize, DataTypes) {
  var Recipe = sequelize.define("Recipe", {
    title: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        len: [1]
      }
    },
    ingredients: {
      type: DataTypes.TEXT,
      allowNull: false,
      validate: {
        len: [1]
      }
    },
    preparation: {
      type: DataTypes.TEXT,
      allowNull: false,
      validate: {
        len: [1]
      }
    },
    image_link: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        len: [1]
      }
    },
    servings: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        len: [1]
      }
    }
  });

  Recipe.associate = function(models) {
    // We're saying that a Recipe should belong to an Author
    // A Recipe can't be created without an Author due to the foreign key constraint
    Recipe.belongsTo(models.Author, {
      foreignKey: {
        allowNull: false
      }
    });
  };

  return Recipe;
};
