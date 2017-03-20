# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require 'scrapod/monitor'

run Scrapod::Monitor
