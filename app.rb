require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmark = Bookmark.create
    @bookmarks = Bookmark.view_titles
    erb :bookmarks
  end

  get '/add_bookmarks' do
    erb :add_bookmarks
  end

  post '/add_bookmarks' do
    @bookmark = Bookmark.create
    @bookmark.add(params[:url], params[:title])
    redirect '/confirmation'
  end

  post '/delete_page' do
    @bookmark = Bookmark.create
    @bookmark.delete(params[:title])
    redirect '/bookmarks'
  end

  get '/confirmation' do
    erb :confirmation
  end

  run! if app_file == $0
end
