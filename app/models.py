# coding: utf-8

__author__ = 'acherubini'

from app import db


class Acquisto(db.Model):
    __tablename__ = 'acquisto'

    id = db.Column(db.Integer, primary_key=True)
    data = db.Column(db.Text, nullable=False)
    fornitore_id = db.Column(ForeignKey('fornitore.id'), nullable=False)

    fornitore = db.relationship('Fornitore')

class AcquistoDettaglio(db.Model):
    __tablename__ = 'acquistoDettaglio'

    id = db.Column(db.Integer, primary_key=True)
    acquisto_id = db.Column(db.ForeignKey('acquisto.id'), nullable=False)
    qta = db.Column(db.Integer, nullable=False)
    prezzo = db.Column(db.Integer, nullable=False)
    iva_id = db.Column(db.ForeignKey('iva.id'), nullable=False)

    acquisto = db.relationship('Acquisto')
    iva = db.relationship('Iva')


class Categoria(db.Model):
    __tablename__ = 'categoria'

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.Text)


class Fornitore(db.Model):
    __tablename__ = 'fornitore'

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.Text, nullable=False)


class Iva(db.Model):
    __tablename__ = 'iva'

    id = db.Column(db.Integer, primary_key=True)
    valore = db.Column(db.Integer, nullable=False)
    descrizione = db.Column(db.Text, nullable=False)


class Prodotto(db.Model):
    __tablename__ = 'prodotto'

    id = db.Column(db.Integer, primary_key=True)
    barcode = db.Column(db.Text, nullable=False)
    descrizione = db.Column(db.Text, nullable=False)
    categoria = db.Column(db.ForeignKey('categoria.id'))

    categoria1 = db.relationship('Categoria')
