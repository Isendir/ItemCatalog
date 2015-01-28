__author__ = 'acherubini'
import os
basedir = os.path.abspath(os.path.dirname(__file__))

WTF_CSRF_ENABLED = True
# presa pari pari da
# https://www.random.org/strings/?num=3&len=20&digits=on&upperalpha=on&loweralpha=on&unique=on&format=html&rnd=new
#
SECRET_KEY = 'gwrt7lGa07LAsAvkPBkvsko34dvpmApBZ7kuheU16jIVlsO1tChPUMmiqLM1'

# Configurazione OpenId
OPENID_PROVIDERS = [
    {'name': 'Google', 'url': 'https://www.google.com/accounts/o8/id'},
    {'name': 'Yahoo', 'url': 'https://me.yahoo.com'},
    {'name': 'AOL', 'url': 'http://openid.aol.com/<username>'},
    {'name': 'Flickr', 'url': 'http://www.flickr.com/<username>'},
    {'name': 'MyOpenID', 'url': 'https://www.myopenid.com'}]

# Flask-SQLAlchemy extension config
SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(basedir, 'app.db')
SQLALCHEMY_MIGRATE_REPO = os.path.join(basedir, 'db_repository')