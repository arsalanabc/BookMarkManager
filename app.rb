require 'sinatra/base'
require './lib/BookMark'
require 'uri'
require 'sinatra/flash'

class BookMarkManager < Sinatra::Base
	enable :sessions
  	register Sinatra::Flash
	
	get '/' do	
		#bookmark = BookMark.new
		@bookmark_urls = BookMark.all
    	erb :index
	end
	
	post "/create" do
		
		if params[:url] =~ /\A#{URI::regexp(['http', 'https'])}\z/
			
			BookMark.create(params[:url], params[:title])
		else 

			
			
			flash[:notice] = "Invalid url"
		end
		redirect "/"
	end


	  # Start the server if ruby file executed directly
  run! if app_file == $0
end