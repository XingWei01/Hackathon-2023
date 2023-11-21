# Hackathon 2023

  - Nom du projet : INFOmon
  - Auteur : Xing Wei
  - Nombre de crédits accumulés à date : 28
  - Description du projet : INFOmon est une recréation du jeu populaire "PokeMon" avec des logiciels ou des langages de programmaation comme monstres. 


  Étant donné le thème de ce Hackathon est "une experience nostalgique" que l'on essayera de recréer (que ce soit sous la forme d'un jeu video, ou d'un site web qui nous aurait pu faciliter la vie à l'époque, j'ai opté plutôt vers la recréation d'une de mes expériences qui a défini mon enfance : PokeMon. Comme j'ai écrit dans les crédits, mes parents n'ont jamais eu le temps de trop s'occuper de moi à mon enfance, et PokeMon m'aidait à ne pas m'ennuyer ou manquer mes parents trop. En effet, je trouvais les interactions et le concept de jouer à des RPG (role playing games) vraiment captivant. C'est pourquoi, j'ai pensé que ce serait un projet idéal dans le cable de ce Hackathon 2023.

# Notes par rapport au jeu : 

Évidemment, le jeu n'est pas terminé. Cependant, la grande image est déjà établie :
  - Un Menu de départ a été créé afin de pouvoir afficher le "Comment jouer", les crédits, le bouton pour quitter le jeu, et pour débuter le jeu.
  - Le logo du jeu a été initialement été modélisé par IA, puis modifier par moi.
  - Pour ce déplacer, il faut simplement utiliser les flèches dans la direction que tu veux aller.
  - Un tilemap a été créé pour les chemins, donc on n'aura pas a mettre les icons un pixel à la fois.
  - Des collisions statiques ont été fait pour que le joueur ne passe pas à travers les murs ou les bâtiments.
  - Des collisions dans le gazon pour faire apparaitre un INFOmon ont été mises en place.
  - La base du système de combat a été créé.

# A FAIRE :

  - Finir la carte
  - Créer un UI pour voir les INFOmon collectionner
  - Créer un dictionnaire d'INFOmon visuel (il y a déjà un début de dictionnaire dans le code de "Game.gd")
  - Créer une manière de sauvegarder le progrès
  - Créer des interactions avec les NPCs (non-player character), par exemple "Gym Leader"
  - Peut-être créer la navigation sur l'eau
  - Optimiser les stats des INFOmons (lorsqu'ils augmentent de niveaux)
  - Faire fonctionner le changement d'INFOmon au milieu d'un combat
  - etc.

# BUGS : 

  - L'animation pour marcher vers la droite ne semble pas fonctionner pour une raison quelconque alors que les autres 3 directions fonctionnent (Je n'ai pas trop toucher après que les 3 autres fonctionnaient puisque je ne voulais pas que soudainement aucune direction ne fonctionne)
  - Le frame pour l'animation pour marcher peut être ajuster puisque des fois, le joueur arrête dans l'animation où il ferait un pas.
