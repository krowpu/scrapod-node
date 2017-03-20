# frozen_string_literal: true

self.log_level = :debug

self.pid_file = '/srv/scrapod/shared/tmp/pids/scrapod-server.pid'

self.log_file = '/srv/scrapod/shared/log/scrapod-server.log'

self.redis_url = 'redis://127.0.0.1:6379'
