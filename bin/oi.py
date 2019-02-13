#!/usr/bin/env python

import os
import sys
import subprocess

imap_status = os.path.expanduser("~/bin/of_status")
os.chmod(imap_status, 0o755)
print("IMAP filter in progress... ")
subprocess.check_call([
    "imapfilter", "-c",
    os.path.expanduser("~/.dotfiles/imapfilter.config.lua"),
], timeout=4 * 60)
print("Done")
print("sync in progress... ")
subprocess.check_call(["offlineimap", "-u", "quiet"], timeout=4 * 60)
print("Done")
os.chmod(imap_status, 0o644)
