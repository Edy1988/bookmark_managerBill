require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  before do
    @bookmark = Bookmark.create
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    erb :bookmarks
  end

  get '/add_bookmarks' do
    erb :add_bookmarks
  end

  post '/add_bookmarks' do
    @bookmark.add(params[:url], params[:title])
    redirect '/confirmation'
  end

  post '/delete_page' do
    @bookmark.delete(params[:title])
    redirect '/bookmarks'
  end

  get '/confirmation' do
    erb :confirmation
  end

  run! if app_file == $0
end
