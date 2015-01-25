CREATE TABLE categoria (
	id INTEGER NOT NULL, 
	nome VARCHAR, 
	PRIMARY KEY (id)
);
CREATE TABLE fornitore (
	id INTEGER NOT NULL, 
	nome VARCHAR NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE prodotto (
	id INTEGER NOT NULL, 
	barcode VARCHAR NOT NULL, 
	descrizione VARCHAR NOT NULL, 
	categoria VARCHAR, 
	PRIMARY KEY (id), 
	FOREIGN KEY(categoria) REFERENCES categoria (id)
);
CREATE TABLE acquisto (
	id INTEGER NOT NULL, 
	prodotto_id INTEGER NOT NULL, 
	fornitore_id INTEGER NOT NULL, 
	data DATE NOT NULL, 
	qta INTEGER NOT NULL, 
	prezzo INTEGER, 
	PRIMARY KEY (id, prodotto_id, fornitore_id), 
	FOREIGN KEY(prodotto_id) REFERENCES prodotto (id), 
	FOREIGN KEY(fornitore_id) REFERENCES fornitore (id)
);
