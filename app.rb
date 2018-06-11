require 'sinatra/base'
require './lib/BookMark'
require 'uri'
require 'sinatra/flash'

class BookMarkManager < Sinatra::Base
	enable :sessions
  	register Sinatra::Flash
  	use Rack::MethodOverride
	
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

	delete '/delete/:id' do
		
    	BookMark.delete(params['id'])
    	redirect '/'
  	end

  	put '/edit/:id' do
  		BookMark.update(params[:id], params[:url], params[:title])
  		redirect '/'
  	end

	  # Start the server if ruby file executed directly
  run! if app_file == $0
end