require 'sinatra/base'
require_relative './lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    @url = params[:url]
    Bookmarks.add(url: @url)
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end



