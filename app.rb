
require 'sinatra/base'
require 'sinatra'
require 'capybara/dsl'
require 'selenium-webdriver'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

get '/' do
  erb :index
end

get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb :bookmarks
end

post '/add_bookmark' do
  @url = params[:url]
  Bookmarks.add(@url)
  redirect '/bookmarks'
end

run! if app_file == $0
set :session_secret, 'super secret'

end
