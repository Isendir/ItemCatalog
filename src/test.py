__author__ = 'acherubini'

#Codice di prova per SQLAlchemy

import sqlalchemy

from sqlalchemy import create_engine
from sqlalchemy.engine import Engine
from sqlalchemy import event

import os
import sys
import pickle
from string import capwords

@event.listens_for(Engine, "connect")
def set_sqlite_pragma(dbapi_connection, connection_record):
    cursor = dbapi_connection.cursor()
    cursor.execute("PRAGMA foreign_keys=ON")
    cursor.close()
#TODO: controllare l'esistenza del file? Sembra non sia necessario

engine = create_engine('sqlite:///test.db', echo=True)

from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()


from sqlalchemy import Column, Integer, String, ForeignKey, Date
from sqlalchemy.orm import relationship, backref
#Supporto alle sessioni
from sqlalchemy.orm import sessionmaker
Session = sessionmaker(bind=engine)
session = Session()
class Prodotto(Base):
    __tablename__= 'prodotto'
    id = Column(Integer, primary_key=True, autoincrement=True)
    barcode = Column(String, nullable=False)
    descrizione= Column(String, nullable=False)
    categoria =Column(String, ForeignKey('categoria.id'))



class Categoria(Base):
    __tablename__ = 'categoria'
    id= Column(Integer, primary_key=True)
    nome = Column(String, nullable=True)

    prodotti = relationship("Prodotto", backref="cat")



class Fornitore(Base):
    __tablename__ = 'fornitore'
    id = Column(Integer, primary_key=True)
    nome = Column(String, nullable=False)



class Acquisto(Base):
    __tablename__= 'acquisto'
    id = Column(Integer, primary_key=True)
    prodotto_id = Column(Integer, ForeignKey('prodotto.id'), primary_key=True)
    fornitore_id = Column(Integer, ForeignKey('fornitore.id'), primary_key=True)
    data = Column(Date, nullable= False)
    qta = Column(Integer, nullable=False)
    prezzo = Column(Integer,nullable=True)

#crea il db
def create_db(engine):
    Base.metadata.create_all(engine)


def load_barcodes(session=session, filename='barcodes'):
    
    with open(filename, encoding='utf-8') as f:
    
        for line in f:
            s = line.split('*',1)
            #Crea un prodotto
            p = Prodotto(barcode = s[0], descrizione= capwords(s[1]))
            #Persiste un prodotto
            session.add(p)
            session.commit()


if __name__ ==('__main__'):
    create_db(engine)
    load_barcodes()