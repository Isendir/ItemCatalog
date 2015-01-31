__author__ = 'acherubini'
from app import app
from flask import request
from flask import render_template

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
    return render_template('index.html')
    #user_agent = request.headers.get('User-Agent')
    #return '<p>Your browser is %s</p>' % user_agent


@app.route('/products')
def prodotti_lista():
    return 'Listing all products we have'


@app.route('/products/<int:product_id>/')
def product_detail(product_id):
    return 'Detail of product #{}.'.format(product_id)


@app.route('/products/<int:product_id>/edit/', methods=['GET','POST'])
def product_edit(product_id):
    return 'Form to edit product #{}.'.format(product_id)


@app.route('/products/create/', methods=['GET','POST'])
def product_create():
    return 'Form to create a new product'


@app.route('/products/<int:product_id>/delete/',methods=(['DELETE']))
def product_delete(product_id):
    raise NotImplementedError('DELETE')

if __name__ == '__main__':
    # Accessibile da tutta la rete sulla porta 8080
    app.run('0.0.0.0', 8080, debug=True)
