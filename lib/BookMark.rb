require 'pg'

class BookMark
	attr_reader :urls

	def initialize
		@urls = []
	end

	def all
		db_name = 'bookmark_manager'

		if ENV['RACK_ENV'] == 'test'
			db_name = 'bookmark_manager_test'
		end 


		connection = PG.connect :dbname => db_name#, :user => 'rxr'
		rows = connection.exec "SELECT * FROM bookmarks"
		rows.each {|row| @urls << row['url']}

		connection.close
		@urls
	end
end