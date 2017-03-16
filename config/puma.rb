# frozen_string_literal: true

environment 'production'

directory '/srv/scrapod/current/'

bind 'unix:///srv/scrapod/shared/tmp/sockets/puma.sock'

pidfile    '/srv/scrapod/shared/tmp/pids/puma.pid'
state_path '/srv/scrapod/shared/tmp/pids/puma.state'

stdout_redirect '/srv/scrapod/shared/log/puma-stdout.log',
                '/srv/scrapod/shared/log/puma-stdout.log',
                true
