-- Base de donnée
-- CREATE DATABASE bibliotheque;
CREATE TABLE auteurs (
    auteur_id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    nationalite VARCHAR(100)
);
CREATE TABLE livres (
    livre_id SERIAL PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    auteur_id INT REFERENCES auteurs(auteur_id)
    ON DELETE SET NULL,
    annee_publication INT,
    genre VARCHAR(100)
);
CREATE TABLE departements (
    departement_id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);
CREATE TABLE etudiant (
    membre_id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    departement_id INT REFERENCES departements(departement_id)
    ON DELETE SET NULL
);
CREATE TABLE emprunts (
    emprunt_id SERIAL PRIMARY KEY,
    membre_id INT REFERENCES etudiant(membre_id)
        ON DELETE CASCADE,
    livre_id INT REFERENCES livres(livre_id)
        ON DELETE CASCADE,
    date_emprunt DATE NOT NULL,
    date_retour DATE
);


