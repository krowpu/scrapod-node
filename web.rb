# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  send_file File.join settings.public_folder, 'index.html'
end
