#!/bin/bash
virtualenv --no-pip --no-setuptools flask
source flask/bin/activate
wget https://bootstrap.pypa.io/get-pip.py
ls
which python
python --version
python get-pip.py 
pip -V
pip install Flask
pip install sqlalchemy
pip install Flask-Script Flask-SQLAlchemy
pip install WTForms
pip install Flask-Login
pip install WTForms-Alchemy
deactivate

