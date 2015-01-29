CREATE TABLE acquisto
(
    id INTEGER PRIMARY KEY,
    data TEXT NOT NULL,
    fornitore_id INTEGER NOT NULL,
    FOREIGN KEY (fornitore_id) REFERENCES fornitore (id)
);
CREATE TABLE acquistoDettaglio
(
    id INTEGER PRIMARY KEY,
    acquisto_id INTEGER NOT NULL,
    qta INTEGER NOT NULL,
    prezzo INTEGER NOT NULL,
    iva_id INTEGER NOT NULL,
    FOREIGN KEY ( acquisto_id ) REFERENCES acquisto (id),
    FOREIGN KEY ( iva_id ) REFERENCES iva (id)
);
CREATE TABLE categoria
(
    id INTEGER NOT NULL,
    nome TEXT,
    PRIMARY KEY (id)
);
CREATE TABLE fornitore
(
    id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE iva
(
    id INTEGER NOT NULL,
    valore INTEGER NOT NULL,
    descrizione TEXT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE prodotto
(
    id INTEGER NOT NULL,
    barcode TEXT NOT NULL,
    descrizione TEXT NOT NULL,
    categoria TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY ( categoria ) REFERENCES categoria ( id ) DEFERRABLE INITIALLY DEFERRED
);
