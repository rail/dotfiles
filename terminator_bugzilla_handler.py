# Based on url_handlers.py by Chris Jones <cmsj@tenshu.net?
# GPL v2 only
import re
import terminatorlib.plugin as plugin

# Every plugin you want Terminator to load *must* be listed in 'AVAILABLE'
AVAILABLE = ['BugzillaBugURLHandler']


class BugzillaBugURLHandler(plugin.URLHandler):
    """Bugzilla Bug URL handler"""

    capabilities = ['url_handler']
    handler_name = 'bugzilla_bug'
    match = r'\b\[?(Bug|bug):?\s?#?[0-9]+(,\s*#?[0-9]+)*\]?\b'
    nameopen = "Open Bugzilla bug"
    namecopy = "Copy bug URL"

    def callback(self, url):
        """Look for the number in the supplied string and return it as a URL"""
        for item in re.findall(r'[0-9]+', url):
            url = 'https://bugzilla.mozilla.org/show_bug.cgi?id=%s' % item
            return(url)
