require 'sinatra/base'
require './lib/BookMark'
require 'uri'
require 'sinatra/flash'

class BookMarkManager < Sinatra::Base
	enable :sessions
  	register Sinatra::Flash
	
	get '/' do	
		bookmark = BookMark.new
		@bookmark_urls = bookmark.all
    	erb :index
	end
	
	post "/create" do
		if params[:bookmark] =~ /\A#{URI::regexp(['http', 'https'])}\z/
			bookmark = BookMark.new
			bookmark.create params[:bookmark]
		else 
			
			flash[:notice] = "Invalid url"
		end
		redirect "/"
	end


	  # Start the server if ruby file executed directly
  run! if app_file == $0
end