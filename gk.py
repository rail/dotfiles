from __future__ import print_function

from offlineimap import get_username, get_password

if __name__ == '__main__':
    import sys
    if len(sys.argv) != 3:
        raise Exception("Usage: prog (user|pass) repo")

    action = sys.argv[1]
    repo = sys.argv[2]
    if action == "user":
        print(get_username(repo), end='')
    elif action == "pass":
        print(get_password(repo), end='')
    else:
        raise Exception("Unknown action")
