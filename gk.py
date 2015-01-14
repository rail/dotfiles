from offlineimap import get_username, get_password

if __name__ == '__main__':
    import sys
    if len(sys.argv) != 3:
        raise Exception("Usage: prog (user|pass) repo")

    action = sys.argv[1]
    repo = sys.argv[2]
    if action == "user":
        print get_username(repo),
    elif action == "pass":
        print get_password(repo),
    else:
        raise Exception("Unknown action")
