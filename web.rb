# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'redis'

redis = Redis.new

get '/' do
  sessions = redis.smembers('sessions').map do |session_id|
    {
      id: session_id,
      started_at: redis.get("session:#{session_id}:started_at"),
    }
  end

  erb :index, locals: { sessions: sessions }
end

get '/monit-frame' do
  erb :monit
end
