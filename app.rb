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

  get '/bookmark/add' do
    erb :'bookmark/add'
  end

  post '/bookmark/add' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end


  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end
  run! if app_file == $0
end
