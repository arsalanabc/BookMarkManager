require 'pg'

class BookMark
	attr_reader :urls

	def initialize
		@urls = []
	end

	def all
		connection = PG.connect :dbname => 'bookmark_manager'#, :user => 'rxr'
		rows = connection.exec "SELECT * FROM bookmarks"
		rows.each {|row| @urls << row['url']}

		connection.close
		@urls
	end
end