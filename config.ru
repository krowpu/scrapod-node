# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'web'
require 'scrapod/monitor'

map '/' do
  run Sinatra::Application
end

map '/monitor' do
  run Scrapod::Monitor
end
