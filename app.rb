require 'sinatra/base'
require_relative './lib/bookmarks.rb'
require 'pg'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    Bookmarks.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete(id: params[:id])
    redirect '/bookmarks'

  end



  patch '/bookmarks/:id' do
    Bookmarks.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/edit' do
    p params
    @bookmark = Bookmarks.find(id: params[:id])
    erb :edit
  end


  run! if app_file == $PROGRAM_NAME



end
