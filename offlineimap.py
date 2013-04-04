prioritized = ['INBOX', 'Bug requests', 'Bugs Assigned', 'Release']


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
