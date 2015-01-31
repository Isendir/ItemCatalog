__author__ = 'acherubini'
import base64
from app import app
from app import db
from flask import request
from flask import render_template
from flask import abort,jsonify,redirect
from flask import url_for
from app.forms import ProdottoForm
from app.models import Prodotto

#app.secret_key= b'e\xe1\xaa,\xf5\xc5\xb3\xa4D\x90\xdej\xf9\xb5\xce\xf8\xe9\x8d\x12F\xa5\xf2%\xe5"P\xd3\x8c\xaf\x1c\x1a\xe4p{\x0f\x90\x16$X\xfdi\xef\x07\xe22\xef\xf8\xceC\x0cc\x00S\xa2\xc2U\x0bJB\xfe\x8a\x86\xcc\x01'

def dump_request_detail(request):
    request_detail="""
# Before request #
request.endpoint: {request.endpoint}
request.method: {request.method}
request.view_args: {request.view_args}
request.args: {request.args}
request.form: {request.form}
request.user_agent: {request.user_agent}
request.files: {request.files}
request.is_xhr: {request.is_xhr}

## request.headers ##
{request.headers}
    """.format(request=request).strip()
    return request_detail


@app.before_request
def callme_before_every_request():
    # Demo only: the before_request hook.
    app.logger.debug(dump_request_detail(request))


@app.after_request
def callme_after_every_response(response):
    # Demo only: the after request hook.
    app.logger.debug('#After Request #\n' + repr(response))
    return response

@app.route('/')
def index():
    user_agent = request.headers.get('User-Agent')
    return render_template('index.html', user_agent=user_agent)


@app.route('/products')
def prodotti_lista():
    return 'Listing all products we have'


@app.route('/products/<int:product_id>/')
def product_detail(product_id):
    return 'Detail of product #{}.'.format(product_id)


@app.route('/products/<int:product_id>/edit/', methods=['GET','POST'])
def product_edit(product_id):
    return 'Form to edit product #{}.'.format(product_id)


@app.route('/products/create/', methods=['GET', 'POST'])
def product_create():
    """Fornisce il form HTML per creare un nuovo prodotto"""
    form = ProdottoForm(request.form)
    if request.method == 'POST' and form.validate():
        prod = Prodotto()
        form.populate_obj(prod)
        db.session.add(prod)
        db.session.commit()
        # Success. Send user back to full product list.
        return redirect(url_for(prodotti_lista))
    # Qui c'è o il primo caricamento o un errore di validazione
    return render_template('prodotto/edit.html', form=form)




@app.route('/products/<int:product_id>/delete/',methods=(['DELETE']))
def product_delete(product_id):
    raise NotImplementedError('DELETE')

if __name__ == '__main__':
    # Accessibile da tutta la rete sulla porta 8080
    app.run('0.0.0.0', 8080, debug=True)
