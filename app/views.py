__author__ = 'acherubini'

from app import app
@app.route('/')
@app.route('/index')

def index():
    return "Ciao Mondo!!!"