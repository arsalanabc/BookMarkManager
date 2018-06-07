require 'pg'

class BookMark
	attr_reader :id, :url, :title

	def initialize(id, url, title)
		@id = id
		@url = url
		@title = title
	end

	def self.all
		
		db_name = 'bookmark_manager'
		db_name = "bookmark_manager_test" if ENV["RACK_ENV"] == "test"

		connection = PG.connect :dbname => db_name
		rows = connection.exec "SELECT * FROM bookmarks"
		connection.close

		
		rows.map {|row| BookMark.new(row['id'], row['url'],row['title'])}
		
	end

	def self.create(url, title)

		return false unless url_checker(url)

		db_name = 'bookmark_manager'
		db_name = "bookmark_manager_test" if ENV['RACK_ENV'] == "test"
		connection = PG.connect :dbname => db_name
		results = connection.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') returning id, url, title;"
		
		connection.close
		BookMark.new(results.first['id'], results.first['url'], results.first['title'])
		
	end



	

	def self.url_checker(url)
		url =~ /\A#{URI::regexp(['http', 'https'])}\z/
	end

end
