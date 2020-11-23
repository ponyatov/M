from M import *
import pytest
def test_ok(): assert True == True


def test_hello():
    assert Object('hello').test() == '\n<object:hello>'
