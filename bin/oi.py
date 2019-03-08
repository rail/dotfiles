#!/usr/bin/env python

import os
import sys
import subprocess

print("IMAP filter in progress... ")
subprocess.check_call([
    "imapfilter", "-c",
    os.path.expanduser("~/.dotfiles/imapfilter.config.lua"),
], timeout=4 * 60)
print("Done")
print("sync in progress... ")
subprocess.check_call(["offlineimap", "-u", "quiet"], timeout=4 * 60)
print("Done")
