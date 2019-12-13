# Defi721
# Crypto Plane

Crypto Plane, un battle card entre avion .

## Comment démarrer

Procédure à suivre pour installer une copie du jeu sur votre machine et lancer les tests.

### Prérequis

Vous devez disposer des applications suivantes sur votre machine:  
Node v12.12.0  
Ganache CLI v6.7.0 
lancer la fonction ganache 


### Installation

Dans un nouveau dossier, faites un clone du repository git sur votre machine:

```
git clone https://github.com/titadone/Defi721.git
```

Puis installez les dépendances dans le dossier du repository avec la commande
```
npm install
```

## Execution des tests

1. Lancer une blockchain ethereum locale à l'aide de Ganache CLI en spécifiant le port et le réseau comme ci-dessous:


2. Excuter la commande "truffle test" dans le répertoire test du dossier cloné.

```
npx truffle test --network ganache
```

### Détails des tests

L'application se compose de deux smarts contracts developpés en Solidity, Poemes.sol et AchatVente.sol .  
Toutes les fonctionnalités des deux smarts contracts sont testées.

Les fonctions disponibles dans le contrat Poemes.sol sont celles issues d'un ERC721 classique (totalSuply(), balanceOf(), approve(), etc.).  
Une fonction permet d'afficher un poeme dans la console.

Les fonctions disponibles dans le contrat AchatVente.sol permettent de mettre en vente et d'acheter un poeme.	


## Deploiement

Les contrats ne sont pas déployés sur le mainnet.


## Versions

Crypto Plane version.  
L'ensemble du code est disponible ici: https://github.com/titadone/Defi721

## Authors

* **Brahima** - https://github.com/titadone/

* **Tony ** - https://github.com/TonySeperoumal/

## License

This project is licensed under the MIT License