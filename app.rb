require 'sinatra/base'
require './lib/BookMark'

class BookMarkManager < Sinatra::Base
	
	get '/' do
		bookmark = BookMark.new
		@bookmark_urls = bookmark.all
    	erb :index
  	end


	  # Start the server if ruby file executed directly
  run! if app_file == $0
end