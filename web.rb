# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end

get '/monit-frame' do
  erb :monit
end
