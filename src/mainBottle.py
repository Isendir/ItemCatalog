#!/usr/bin/python3
# *-* coding: utf-8 *-*

__author__ = 'Ampelio Cherubini <ampelio.cherubini@gmail.com>'

from string import capwords

from bottle import Bottle, route, run, debug
from bottle import redirect, request, template
from bottle.ext import sqlalchemy

from sqlalchemy import create_engine
from sqlalchemy.engine import Engine
from sqlalchemy import event

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy import Column, Integer, String, ForeignKey, Date
from sqlalchemy.orm import relationship

from sqlalchemy.orm import sessionmaker

@event.listens_for(Engine, "connect")
def set_sqlite_pragma(dbapi_connection, connection_record):
    '''Abilito l'utilizzo delle foreign keys - Viene eseguito ad ogni connessione al db
    :param dbapi_connection:
    :param connection_record:
    '''
    cursor = dbapi_connection.cursor()
    cursor.execute("PRAGMA foreign_keys=ON")
    cursor.close()
#TODO: controllare l'esistenza del file? Sembra non sia necessario

# --------------------------------
# Add SQLAlchemy app
# --------------------------------
app = Bottle()

Base = declarative_base()
engine = create_engine("sqlite:///todo.db", echo=True)
create_session = sessionmaker(bind=engine)

plugin = sqlalchemy.Plugin(
        engine,
        Base.metadata,
        keyword='db',
        create=True,
        commit=True,
        use_kwargs=False
)

app.install(plugin)
Base = declarative_base()
engine = create_engine('sqlite:///test.db', echo=True)


#Classi del database

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
    __tablename__ = 'acquisto'
    id = Column(Integer, primary_key=True)
    prodotto_id = Column(Integer, ForeignKey('prodotto.id'), primary_key=True)
    fornitore_id = Column(Integer, ForeignKey('fornitore.id'), primary_key=True)
    data = Column(Date, nullable= False)
    qta = Column(Integer, nullable=False)
    prezzo = Column(Integer,nullable=True)



