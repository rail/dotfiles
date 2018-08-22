#!/usr/bin/env python
from __future__ import print_function
import subprocess

PRIORITIZED = ['INBOX', 'My bugs', 'Release', 'tb-drivers']


def mycmp(x, y):
    if hasattr(x, 'name'):
        x = x.name
    if hasattr(y, 'name'):
        y = y.name
    for prefix in PRIORITIZED:
        xsw = x.startswith(prefix)
        ysw = y.startswith(prefix)
        if xsw and ysw:
            return cmp(x.lower(), y.lower())
        elif xsw:
            return -1
        elif ysw:
            return +1
    return cmp(x.lower(), y.lower())


def get_password(key):
    return subprocess.check_output(['pass', key]).strip()
