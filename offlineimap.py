#!/usr/bin/env python
from __future__ import print_function

import gnomekeyring as gkey

prioritized = ['INBOX', 'My bugs', 'Release', 'tb-drivers']


def mycmp(x, y):
    if hasattr(x, 'name'):
        x = x.name
    if hasattr(y, 'name'):
        y = y.name
    for prefix in prioritized:
        xsw = x.startswith(prefix)
        ysw = y.startswith(prefix)
        if xsw and ysw:
            return cmp(x.lower(), y.lower())
        elif xsw:
            return -1
        elif ysw:
            return +1
    return cmp(x.lower(), y.lower())


def set_credentials(repo, user, pw):
    KEYRING_NAME = "offlineimap"
    attrs = {"repo": repo, "user": user}
    keyring = gkey.get_default_keyring_sync()
    gkey.item_create_sync(keyring, gkey.ITEM_NETWORK_PASSWORD, KEYRING_NAME,
                          attrs, pw, True)


def get_credentials(repo):
    attrs = {"repo": repo}
    items = gkey.find_items_sync(gkey.ITEM_NETWORK_PASSWORD, attrs)
    return (items[0].attributes["user"], items[0].secret)


def get_username(repo):
    return get_credentials(repo)[0]


def get_password(repo):
    return get_credentials(repo)[1]


if __name__ == "__main__":
    import sys
    import os
    import getpass
    if len(sys.argv) != 3:
        print( "Usage: %s <repository> <username>" % (os.path.basename(sys.argv[0])))
        sys.exit(0)
    repo, username = sys.argv[1:]
    password = getpass.getpass("Enter password for user '%s': " % username)
    password_confirmation = getpass.getpass("Confirm password: ")
    if password != password_confirmation:
        print("Error: password confirmation does not match")
        sys.exit(1)
    set_credentials(repo, username, password)
