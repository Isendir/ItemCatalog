
from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy


from app.models import Base

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///db/app.db'

db = SQLAlchemy(app)
db.Model = Base
