
from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy


app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///db/app.db'
app.config['SECRET_KEY'] = b'e\xe1\xaa,\xf5\xc5\xb3\xa4D\x90\xdej\xf9\xb5\xce\xf8\xe9\x8d\x12F\xa5\xf2%\xe5"P\xd3\x8c\xaf\x1c\x1a\xe4p{\x0f\x90\x16$X\xfdi\xef\x07\xe22\xef\xf8\xceC\x0cc\x00S\xa2\xc2U\x0bJB\xfe\x8a\x86\xcc\x01'
app.config['SQLALCHEMY_RECORD_QUERIES'] = True
db = SQLAlchemy(app)

