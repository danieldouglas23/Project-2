# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.25)
# Database: blogger
# Generation Time: 2019-04-16 18:08:50 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Authors`;

CREATE TABLE `Authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;

INSERT INTO `Authors` (`id`, `name`, `createdAt`, `updatedAt`)
VALUES
	(3,'Matthew Hopkins','2019-04-16 18:02:23','2019-04-16 18:02:23'),
	(4,'Michael Diaz','2019-04-16 18:02:27','2019-04-16 18:02:27'),
	(5,'Daniel Douglas','2019-04-16 18:02:33','2019-04-16 18:02:33'),
	(6,'Badri Abdi','2019-04-16 18:02:40','2019-04-16 18:02:40');

/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Recipes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Recipes`;

CREATE TABLE `Recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `ingredients` text NOT NULL,
  `preparation` text NOT NULL,
  `social_rank` int(11) NOT NULL DEFAULT '0',
  `image_link` varchar(255) NOT NULL,
  `servings` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AuthorId` (`AuthorId`),
  CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`AuthorId`) REFERENCES `Authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Recipes` WRITE;
/*!40000 ALTER TABLE `Recipes` DISABLE KEYS */;

INSERT INTO `Recipes` (`id`, `title`, `ingredients`, `preparation`, `social_rank`, `image_link`, `servings`, `createdAt`, `updatedAt`, `AuthorId`)
VALUES
	(3,'Steak Picadillo Soft Tacos','1 tablespoon extra-virgin olive oil \n|| 1 12-ounce strip of skirt steak \n|| 1/2 cup 1/4-inch squares green bell pepper \n|| 3/4 cup canned diced tomatoes with green chiles\n|| 1/3 cup halved drained pimiento-stuffed green olives plus brine from jar \n|| 1/4 cup raisins \n|| 1 tablespoon tomato paste \n|| 1 teaspoon ground cumin \n|| 1/2 teaspoon ground allspice \n|| 8 corn tortillas\n|| Chopped fresh cilantro (for garnish)','Heat oil in large nonstick skillet over medium-high heat. Sprinkle steak with salt and pepper. Add to skillet; sauté 3 to 4 minutes per side for medium-rare. Transfer to plate. Add bell pepper to skillet. Sauté 2 minutes. Add tomatoes with green chiles,olives, raisins, tomato paste, cumin, and allspice. Simmer until sauce is thick, stirring often, 3 to 4 minutes. Season to taste with salt, pepper, and olive brine.\nCut steak into 1/3-inch-thick slices on diagonal across grain. Add steak and any juices to sauce in skillet; toss to blend.\nChar tortillas over gas flame or in broiler until blackened in spots, 15 to 20 seconds per side. Divide filling among tortillas. Sprinkle with cilantro and serve.','0','https://assets.epicurious.com/photos/54b2f0a711c5d6af478b43ec/6:4/w_620%2Ch_413/364552_steak-picadillo-soft-tacos_1x1.jpg','4','2019-04-16 18:03:25','2019-04-16 18:03:25',3),
	(4,'Tacos al Pastor','1 large white onion halved \n|| 1 pineapple peeled cut crosswise into 1/2-inch-thick rounds \n|| 1/2 cup fresh orange juice \n|| 1/4 cup distilled white vinegar \n|| 1/4 cup guajillo chile powder \n|| 3 garlic cloves halved \n|| 2 teaspoons coarse kosher salt \n|| 1 teaspoon dried oregano (preferably Mexican) \n|| 1 teaspoon ground cumin \n|| 1 large or 2 small chipotle chiles and 1 to 2 teaspoons adobo from canned chipotle chiles in adobo \n|| 1 2 1/2-to 3-pound boneless pork loin cut into 1/2-inch slices \n|| 1/4 cup chopped fresh cilantro \n|| Corn tortillas \n|| Smoky Two-Chile Salsa \n|| Lime wedges','Coarsely chop 1 onion half. Coarsely chop 2 pineapple rounds, discarding core; cover and chill remaining pineapple. Place chopped onion and chopped pineapple in blender. Add orange juice and next 7 ingredients; puree marinade until smooth. Place pork in large resealable plastic bag. Add marinade and seal bag, releasing excess air. Turn to coat. Chill at least 4 hours and up to 1 day.\nPrepare barbecue (medium-high heat). Grill remaining pineapple until warm and slightly charred, 4 to 6 minutes per side. Grill pork with some marinade still clinging until slightly charred and cooked through, 2 to 4 minutes per side. Transfer pineapple and pork to work surface; chop pineapple into 1/2-inch cubes, discarding cores. Chop pork. Transfer to platter; toss to combine.\nMeanwhile, finely chop remaining onion half and place in medium bowl. Add cilantro; toss to combine. Grill tortillas until warm and slightly charred, about 10 seconds per side.\nServe pork-pineapple mixture with onion-cilantro relish, Smoky Two-Chile Salsa, and lime wedges.\nTest Kitchen Tip: To make your own guajillo chile powder, finely grind about 6 large dried seeded guajillo chiles in a spice mill to yield about 1/4 cup powder.','0','https://assets.epicurious.com/photos/5b747e86fb8a0329e97a82bb/6:4/w_620%2Ch_413/tacos-al-pasto-recipe-081518.jpg','6','2019-04-16 18:04:35','2019-04-16 18:04:35',4),
	(5,'Grilled Chicken Tacos','1 medium onion, cut into wedges, keeping root intact \n|| 2 garlic cloves, finely chopped \n|| 1 pound skinless, boneless chicken thighs \n|| 1 tablespoon cumin seeds, coarsely crushed \n|| 1 tablespoon vegetable oil \n|| 1 teaspoon kosher salt \n|| 1/2 teaspoon freshly ground black pepper \n|| 8 corn tortillas, warmed (for serving) \n|| 2 avocados, sliced (for serving) \n|| Charred Tomatillo Salsa Verde (for serving) \n|| Cilantro sprigs, sliced radishes, and lime wedges (for serving)','Prepare grill for medium-high heat. Toss onion, garlic, chicken, cumin, oil, salt, and pepper in a medium bowl. Grill onion and chicken until cooked through and lightly charred, about 4 minutes per side.\nLet chicken rest 5 minutes before slicing. Serve with tortillas, avocados, Charred Tomatillo Salsa Verde, cilantro, radishes, and lime wedges.','0','https://assets.epicurious.com/photos/54af451f4074bdfd06837f8c/6:4/w_620%2Ch_413/51175340_grilled-chicken-tacos_1x1.jpg','4','2019-04-16 18:05:34','2019-04-16 18:05:34',5),
	(6,'Grilled Fish Tacos','2 cups chopped white onion, divided \n|| 3/4 cup chopped fresh cilantro, divided \n|| 1/4 cup olive oil \n|| 5 tablespoons fresh lime juice, divided \n|| 3 tablespoons fresh orange juice \n|| 2 garlic cloves, minced \n|| 1 teaspoon dried oregano (preferably Mexican) \n|| 1 pound tilapia, striped bass, or sturgeon fillets \n|| Coarse kosher salt \n|| 1 cup mayonnaise \n|| 1 tablespoon milk \n|| Corn tortillas \n|| 2 avocados, peeled, pitted, sliced \n|| 1/2 small head of cabbage, cored, thinly sliced \n|| Salsa Verde \n|| Lime wedges','Stir 1 cup onion, 1/4 cup cilantro, oil, 3 tablespoons lime juice, orange juice, garlic, and oregano in medium bowl. Sprinkle fish with coarse salt and pepper. Spread half of onion mixture over bottom of 11x7x2-inch glass baking dish. Arrange fish atop onion mixture. Spoon remaining onion mixture over fish. Cover and chill 30 minutes. Turn fish; cover and chill 30 minutes longer. Whisk mayonnaise, milk, and remaining 2 tablespoons lime juice in small bowl.\nBrush grill grate with oil; prepare barbecue (medium-high heat). Grill fish with some marinade still clinging until just opaque in center, 3 to 5 minutes per side. Grill tortillas until slightly charred, about 10 seconds per side.\nCoarsely chop fish; place on platter. Serve with lime mayonnaise, tortillas, remaining 1 cup chopped onion, remaining 1/2 cup cilantro, avocados, cabbage, Salsa Verde, and lime wedges.','0','https://assets.epicurious.com/photos/590cb54db84ce532c25148d9/6:4/w_620%2Ch_413/grilled-fish-tacos-050517.jpg','4','2019-04-16 18:06:21','2019-04-16 18:06:21',6),
	(7,'Black Bean Tacos with Corn Salsa','Olive oil cooking spray \n|| 2 cloves garlic \n|| 2 1/2 cups canned black beans, rinsed and drained \n|| 1/4 cup rolled oats \n|| 1/4 cup cornmeal \n|| 1 tablespoon chili powder \n|| 1 teaspoon kosher salt, divided \n|| 1/2 teaspoon freshly ground black pepper, divided \n|| 8 small corn tortillas \n|| 1 cup corn, thawed if frozen \n|| 1 medium red bell pepper, chopped \n|| 1 small green chile, diced \n|| 2 scallions, chopped \n|| Juice of 2 limes \n|| 1/4 cup chopped fresh cilantro','Heat oven to 400°F. Coat a baking sheet with cooking spray. In a food processor, chop garlic.\nAdd beans, oats, cornmeal, chili powder, 3/4 teaspoon salt and 1/4 teaspoon black pepper; process, stopping once or twice to scrape down sides, until mixture is combined, 1 minute. Crumble bean mixture with hands, sprinkle on prepared sheet, and coat with cooking spray. Bake until firm and crisp on bottom, 10 to 15 minutes.\nUse a spoon to break up pieces, coat with cooking spray, and bake until crisp all over, 10 to 15 minutes. Stack tortillas and wrap in foil; warm in oven 5 minutes. In a bowl, combine corn, bell pepper, chile, scallions and remaining 1/4 teaspoon salt and 1/4 teaspoon black pepper; sprinkle with lime juice. Divide bean crumble among tortillas; top with corn salsa and cilantro.','0','https://assets.epicurious.com/photos/54b19372a801766f773f392c/6:4/w_620%2Ch_413/395098_black-bean-tacos_1x1.jpg','4','2019-04-16 18:06:58','2019-04-16 18:06:58',3),
	(8,'Jackfruit Tacos','1 can (14 oz) young green jackfruit in water \n|| 1 white onion \n|| 4 garlic cloves \n|| 1 tbsp vegetable oil \n|| 1 tbsp maple syrup \n|| 7 tbsp vegetable stock \n|| 1/2 tsp Tabasco sauce \n|| 4 limes \n|| 1 1/2 tsp ground cumin \n|| 1 1/2 tsp smoked paprika \n|| 1/2-1 tsp chili powder \n|| 1/2 tsp salt \n|| Handful fresh cilantro \n|| 12 crunchy taco shells \n|| 1 cup guacamole \n|| 1 cup salsa','Tip the jackfruit into a sieve or colander to drain the excess water and pat the pieces down with a clean kitchen towel to dry them off | Cut into 1/4-inch strips and put to one side\nPeel and slice the onion and garlic very thinly | Warm the vegetable oil in the frying pan |\nAdd the onion and garlic to the pan and stir with a wooden spoon until soft and translucent |\nAdd the jackfruit, maple syrup, vegetable stock, and Tabasco sauce | Cut 1 of the limes in half and squeeze in the juice of one half, catching any seeds in your other hand | Stir until the jackfruit is well covered\nPut the lid on the pan, turn down the heat, and let it simmer for 7–10 minutes, stirring occasionally, until the liquid has been absorbed into the jackfruit | Take the lid off the pan and sprinkle in all the spices and the salt | Stir until the jackfruit pieces are well covered and taking on the color of the spices | Transfer the jackfruit pieces to a serving dish\nSlice the remaining limes into wedges and remove the leaves from the cilantro by running your thumb and forefinger from the top to the base of the stems (the leaves should easily come away), saving the stems for another recipe | Serve the taco shells, jackfruit, guacamole, salsa, lime wedges, and cilantro leaves on individual plates and let everyone build their own tacos','0','https://assets.epicurious.com/photos/5ae38af020e37426cda191eb/6:4/w_620%2Ch_413/jackfruit-tacos-recipe-HC-042718.jpg','6','2019-04-16 18:07:41','2019-04-16 18:07:41',4),
	(9,'Lime-Cilantro Pork Tacos','1 pound pork tenderloin trimmed and cut into thin strips \n        || 1/4 teaspoon salt \n        || 1/8 teaspoon freshly ground black pepper \n        || 2 teaspoons olive oil \n        || 1 1/2 cups thinly sliced onion \n        || 1 small jalapeño pepper, seeded and chopped \n        || 1/2 cup fat-free, less-sodium chicken broth \n        || 1/2 cup chopped plum tomato \n        || 3 tablespoons chopped cilantro \n        || 2 1/2 tablespoons fresh lime juice \n        || 8 (6-inch) flour tortillas','Step 1: Heat a large nonstick skillet over medium-high heat. Sprinkle pork with salt and black pepper. Add oil to pan. Add pork, and sauté 4 minutes or until browned. Remove pork from pan; place in a bowl. Add onion and jalapeño to pan; sauté 5 minutes or until tender. Add broth; reduce heat, and simmer 1 minute, scraping pan to loosen browned bits. Stir in tomato; simmer 2 minutes.\nStep 2: Return pork and accumulated juices to pan. Stir in cilantro and lime juice; cook 1 minute or until pork is done.\nStep 3: Heat tortillas according to package directions. Spoon 1/2 cup pork mixture into each tortilla; roll up.','0','https://cdn-image.myrecipes.com/sites/default/files/image/recipes/ck/04/06/pork-tacos-ck-642341-x.jpg','6','2019-04-16 18:08:14','2019-04-16 18:08:14',5);

/*!40000 ALTER TABLE `Recipes` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
