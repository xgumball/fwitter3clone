require './config/environment'
require './app/models/tweet'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @tweets = Tweet.all
    erb :index
  end

  get '/tweet' do
    erb :tweet
  end

  post '/tweet' do
    Tweet.new(params[:username], params[:status])
    redirect '/' 
  end

end
