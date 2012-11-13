prioritized = ['INBOX', 'Release', 'Bug requests', 'Bugs Assigned']


def mycmp(x, y):
    for prefix in prioritized:
        xsw = x.name.startswith(prefix)
        ysw = y.name.startswith(prefix)
        if xsw and ysw:
            return cmp(x.name, y.name)
        elif xsw:
            return -1
        elif ysw:
            return +1
    return cmp(x.name, y.name)
