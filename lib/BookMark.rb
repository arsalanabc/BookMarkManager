require 'pg'

class BookMark
	def all
		urls = []
		db_name = 'bookmark_manager'
		db_name = "bookmark_manager_test" if ENV["RACK_ENV"] == "test"

		connection = PG.connect :dbname => db_name
		rows = connection.exec "SELECT * FROM bookmarks"
		rows.each {|row| urls << row['url']}
		connection.close

		urls
	end

	def create(new_url)

		return false unless url_checker(new_url)

		db_name = 'bookmark_manager'
		db_name = "bookmark_manager_test" if ENV['RACK_ENV'] == "test"
		connection = PG.connect :dbname => db_name
		connection.exec "INSERT INTO bookmarks (url) VALUES ('#{new_url}');"
		connection.close
	end

	private

	def url_checker(url)
		url =~ /\A#{URI::regexp(['http', 'https'])}\z/
	end

end