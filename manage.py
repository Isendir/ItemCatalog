#!flask/bin/python
__author__ = 'acherubini'

from flask.ext.script import Manager
from app import app
from app import models
from app import forms

manager = Manager(app)
app.config['Debug'] = True #Ensure debugger will load


if __name__ == '__main__':
    manager.run()
