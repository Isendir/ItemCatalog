from peewee import *

database = SqliteDatabase('sampleData/test.db', **{})

class UnknownField(object):
    pass

class BaseModel(Model):
    class Meta:
        database = database

class Fornitore(BaseModel):
    nome = TextField()

    class Meta:
        db_table = 'fornitore'

class Acquisto(BaseModel):
    data = TextField()
    fornitore = ForeignKeyField(db_column='fornitore_id', rel_model=Fornitore, to_field='id')

    class Meta:
        db_table = 'acquisto'

class Iva(BaseModel):
    descrizione = TextField()
    valore = IntegerField()

    class Meta:
        db_table = 'iva'

class Acquistodettaglio(BaseModel):
    acquisto = ForeignKeyField(db_column='acquisto_id', rel_model=Acquisto, to_field='id')
    iva = ForeignKeyField(db_column='iva_id', rel_model=Iva, to_field='id')
    prezzo = IntegerField()
    qta = IntegerField()

    class Meta:
        db_table = 'acquistoDettaglio'



class Categoria(BaseModel):
    nome = TextField(null=True)

    class Meta:
        db_table = 'categoria'

class Prodotto(BaseModel):
    barcode = TextField()
    categoria = ForeignKeyField(db_column='categoria', null=True, rel_model=Categoria, to_field='id')
    descrizione = TextField()

    class Meta:
        db_table = 'prodotto'

