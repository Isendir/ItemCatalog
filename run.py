#!flask/bin/python
from app import app
from app import models,views,forms

app.run(debug=True)