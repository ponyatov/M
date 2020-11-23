import os
import sys


class Object:

    def __init__(self, V):
        self.type = self.__class__.__name__.lower()
        self.value = V
        self.slot = {}
        self.nest = []

    def test(self): return self.dump(test=True)

    def __repr__(self): return self.dump(test=False)

    def dump(self, depth=0, prefix='', tab='\t', test=False):
        ret = self.pad(depth, tab) + self.head(depth, prefix, test)
        return ret

    def head(self, prefix='', tab='\t', test=False):
        xid = '' if test else f' @{id(self):x}'
        return f'<{self.type}:{self.value}>{xid}'

    def pad(self, depth, tab='\t'):
        return f'\n{tab*depth}'
