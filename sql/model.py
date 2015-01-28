# coding: utf-8
from sqlalchemy import Column, ForeignKey, Integer, Text
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class Acquisto(Base):
    __tablename__ = 'acquisto'

    id = Column(Integer, primary_key=True)
    data = Column(Text, nullable=False)
    fornitore_id = Column(ForeignKey('fornitore.id'), nullable=False)

    fornitore = relationship('Fornitore')


class AcquistoDettaglio(Base):
    __tablename__ = 'acquistoDettaglio'

    id = Column(Integer, primary_key=True)
    acquisto_id = Column(ForeignKey('acquisto.id'), nullable=False)
    qta = Column(Integer, nullable=False)
    prezzo = Column(Integer, nullable=False)
    iva_id = Column(ForeignKey('iva.id'), nullable=False)

    acquisto = relationship('Acquisto')
    iva = relationship('Iva')


class Categoria(Base):
    __tablename__ = 'categoria'

    id = Column(Integer, primary_key=True)
    nome = Column(Text)


class Fornitore(Base):
    __tablename__ = 'fornitore'

    id = Column(Integer, primary_key=True)
    nome = Column(Text, nullable=False)


class Iva(Base):
    __tablename__ = 'iva'

    id = Column(Integer, primary_key=True)
    valore = Column(Integer, nullable=False)
    descrizione = Column(Text, nullable=False)


class Prodotto(Base):
    __tablename__ = 'prodotto'

    id = Column(Integer, primary_key=True)
    barcode = Column(Text, nullable=False)
    descrizione = Column(Text, nullable=False)
    categoria = Column(ForeignKey('categoria.id'))

    categoria1 = relationship('Categoria')
