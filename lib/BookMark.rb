require 'pg'

puts PG.library_version.to_s

class BookMark
	attr_reader :urls

	def initialize
		@urls = []
	end


	def all
		connect = PG.connect :dbname => 'bookmark_manager', :user => 'azlan'
		rows = connect.exec "SELECT * FROM bookmarks"
		rows.each {|row| @urls << row['url']}

		connect.close
		@urls
	end



end


b = BookMark.new
b.all