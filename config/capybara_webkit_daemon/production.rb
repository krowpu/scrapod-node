# frozen_string_literal: true

config = $capybara_webkit_daemon_config

config.debug = true

config.pid_file = '/src/scrapod/shared/tmp/pids/capybara.pid'

config.log_file = '/srv/scrapod/shared/log/capybara.log'
