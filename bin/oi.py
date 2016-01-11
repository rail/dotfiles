#!/usr/bin/env python

import sh
import os
import sys

imap_status = os.path.expanduser("~/bin/of_status")
os.chmod(imap_status, 0o755)
print "IMAP filter in progress... ",
sys.stdout.flush()
sh.nice("imapfilter", "-c",
        os.path.expanduser("~/.dotfiles/imapfilter.config.lua"),
        _timeout=3 * 60)
print "Done"
print "sync in progress... ",
sys.stdout.flush()
sh.nice("offlineimap", _timeout=3 * 60)
print "Done"
os.chmod(imap_status, 0o644)
