# Epsivent

Ce readme explique comment lancer l'API d'Epsivent Vous trouverez ci-dessous les étapes nécessaire à l'installation et
l'utilisation du dépot

### Installer les dépendances

Quand vous récupérez le dépôt, il est important d'initialiser les dépendances. </br>
Réaliser un `make install` qui va installer toutes les dépendances nécessaires au bon fonctionnement de l'instance
Symfony.

### Lancer et stopper l'instance Symfony

**Une fois les dépendances installées**, vous pouvez lancer votre application Symfony avec la commande `make dev` qui
vient lancer l'environnement de développement.

Pour arrêter l'instance Symfony, lancez la commande `make stop` qui vient arrêter totalement l'application.

### L'environnement de développement

- `localhost:8000` : Contient l'environnement Symfony
- `localhost:8080` : Permet d'accéder à l'outil de gestion de DB