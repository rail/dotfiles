#!/usr/bin/env python

import sh
import os

imap_status = os.path.expanduser("~/bin/of_status")
os.chmod(imap_status, 0o755)
sh.nice("imapfilter", "-c",
        os.path.expanduser("~/.dotfiles/imapfilter.config.lua"),
        _timeout=3 * 60)
sh.nice("offlineimap", _timeout=3 * 60)
os.chmod(imap_status, 0o644)
