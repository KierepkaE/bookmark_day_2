require 'sinatra/base'
require 'pg'
require 'uri'
require 'sinatra/flash'
require_relative './lib/bookmarks.rb'
require_relative './lib/database_connection.rb'
require_relative './lib/database_connection_setup.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    flash[:notice] = "You must submit a valid URL." unless Bookmarks.add(url: params[:url], title: params[:title])
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
    @bookmark = Bookmarks.find(id: params[:id])
    erb :edit
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :add_comment
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end


  run! if app_file == $PROGRAM_NAME



end
