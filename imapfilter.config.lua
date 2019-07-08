-- Options --
options.timeout = 60
options.subscribe = true
options.create = true
options.info = true
options.certificates = false

username = "raliiev@mozilla.com"
status, password = pipe_from("pass email/raliiev@mozilla.com")

acc = IMAP {
    server = "imap.gmail.com",
    ssl = "tls1",
    username = username,
    password = password
}

-- Bughmail --
-- gmail filters put all bugmail under Bugs
bugs = acc.Bugs

mine = bugs:contain_field('X-Bugzilla-Reason', 'AssignedTo') +
       bugs:contain_field('X-Bugzilla-Type', 'request')
mine:move_messages(acc["My bugs"])

new_bugs = bugs:contain_field('X-Bugzilla-Type', 'new')
new_bugs:move_messages(acc["Bugs New"])

-- release_bugs = bugs:contain_field('X-Bugzilla-Component', 'Release Automation') +
--                bugs:contain_field('X-Bugzilla-Component', 'Releases')
-- release_bugs:move_messages(acc["Bugs Releases"])


cc = bugs:contain_field('X-Bugzilla-Who', 'rail@mozilla.com') +
     bugs:contain_field('X-Bugzilla-Reason', 'Reporter') +
     bugs:contain_field('X-Bugzilla-Reason', 'CC')
cc:move_messages(acc["Bugs CC"])

-- /Bugmail --

inbox = acc.INBOX

-- releases
-- release_failures = inbox:match_subject("\\[release\\] .*: failed at ")
-- release_failures:move_messages(acc["Release failures"])

-- thunderbird-drivers ML comes via release ML, no easy way to identify it by headers
tb = inbox:contain_to("thunderbird-drivers@mozilla.org") +
     inbox:contain_cc("thunderbird-drivers@mozilla.org")
tb:move_messages(acc["tb-drivers"])
