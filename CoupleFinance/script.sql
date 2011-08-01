/* SQLEditor (SQLite)*/

CREATE TABLE Partenaire
(
idPartenaire INTEGER NOT NULL PRIMARY KEY  AUTOINCREMENT,
nom TEXT,
prenom TEXT
);

CREATE TABLE Personne
(
idPersonne INTEGER NOT NULL PRIMARY KEY  AUTOINCREMENT,
udid TEXT NOT NULL,
idPartenaire INTEGER NOT NULL REFERENCES Partenaire (idPartenaire)
);

CREATE TABLE Historique
(
idHistorique INTEGER NOT NULL PRIMARY KEY  AUTOINCREMENT,
debutPeriode TEXT NOT NULL,
finPeriode TEXT NOT NULL,
idPersonne INTEGER NOT NULL REFERENCES Personne (idPersonne)
);

CREATE TABLE TransactionFinance
(
idTransactionFinance INTEGER NOT NULL PRIMARY KEY  AUTOINCREMENT,
date TEXT NOT NULL,
valeur REAL NOT NULL,
idPersonne INTEGER NOT NULL REFERENCES Personne (idPersonne)
);

