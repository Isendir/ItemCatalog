__author__ = 'acherubini'

# Utilizzo WTForms-Alchemy per creare i form come da modello

from app import app
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import Form
from wtforms_alchemy import model_form_factory
from app.models import Prodotto, Acquisto, AcquistoDettaglio, Iva
from app.models import Categoria, Fornitore


db = SQLAlchemy(app)

# Reference https://wtforms-alchemy.readthedocs.org/en/latest/advanced.html
# The variable db here is a SQLAlchemy object instance from
# Flask-SQLAlchemy package

BaseModelForm = model_form_factory(Form)


class ModelForm(BaseModelForm):
    @classmethod
    def get_session(self):
        return db.session


class ProdottoForm(ModelForm):
    class Meta:
        model = Prodotto


class AcquistoForm(ModelForm):
    class Meta:
        model = Acquisto


class AcquistoDettaglioForm(ModelForm):
    class Meta:
        model = AcquistoDettaglio


class CategoriaForm(ModelForm):
    class Meta:
        model = Categoria


class IvaForm(ModelForm):
    class Meta:
        model = Iva


class FornitoreForm(ModelForm):
    class Meta:
        model = Fornitore

