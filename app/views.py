__author__ = 'acherubini'

from app import app
from app import db

from flask import request,jsonify
from flask import render_template
from flask import redirect
from flask import url_for
from app.forms import ProdottoForm
from app.models import Prodotto


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
def products_list():
    """Provide HTML listing of all products"""
    # Query: Get all Products objects, sorted by barcode
    products = Prodotto.query.all()
    #res={}
    #for product in products:
     #   res[product.id] = {'barcode': product.barcode, 'descrizione': product.descrizione, 'categoria': product.categoria}

    #return jsonify(res)
    return render_template('products/index.html', products=products)



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
    return render_template('products/edit.html', form=form)




@app.route('/products/<int:product_id>/delete/',methods=(['DELETE']))
def product_delete(product_id):
    raise NotImplementedError('DELETE')

# if __name__ == '__main__':
#     # Accessibile da tutta la rete sulla porta 8080
#     app.run('0.0.0.0', 8080, debug=True)
