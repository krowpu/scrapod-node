# frozen_string_literal: true

require 'sinatra'

get '/' do
  erb :index
end

get '/monit-frame' do
  erb :monit
end
