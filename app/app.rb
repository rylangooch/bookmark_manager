ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
# require './app/models/user.rb'


class BookmarkManager < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'

    get '/user/new' do
      erb :'user/new'
    end

    post '/users' do
      user = User.create(email: params[:email], password_digest: params[:password], password_confirmation: params[:password_confirmation])

      session[:user_id] = user.id
      redirect to '/links'
    end

    get '/links' do
      @links = Link.all
      erb :'links/index'
    end

    post '/links' do
        link = Link.new(url: params[:url], title: params[:title])
        params[:tags].split(' ').each do |tag|
          link.tags << Tag.create(name: tag)
        end
      link.save
      redirect to '/links'
    end

    get '/links/new' do
      erb :'links/new'
    end

    get'/tags/:name' do
      tag = Tag.first(name: params[:name])
      @links = tag ? tag.links : []
      erb :'links/index'
    end

    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
