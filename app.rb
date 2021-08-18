require "sinatra"
require "sinatra/base"
require "sinatra/reloader" if development?
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end 

  get '/add-bookmark' do
    erb :add_bookmark
  end

  post '/add-bookmark' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end


  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end
  run! if app_file == $0
end
