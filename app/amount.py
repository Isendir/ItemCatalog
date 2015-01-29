__author__ = 'acherubini'

import sqlalchemy.types as types


class AmountType(types.TypeDecorator):
    impl = types.Numeric

    def __init__(self,currency):
        self.currency = currency
        super(AmountType,self).__init__()

    def process_bind_param(self, value, dialect):