require 'pg'

class BookMark
	def all
		urls = []
		db_name = 'bookmark_manager'
		db_name = "bookmark_manager_test" if ENV["RACK_ENV"] == "test"

		connection = PG.connect :dbname => db_name
		rows = connection.exec "SELECT * FROM bookmarks"
		# rows.each {|row| urls << row['url']}
		connection.close

		# urls
		rows
	end

	def create(url, title)

		return false unless url_checker(url)

		db_name = 'bookmark_manager'
		db_name = "bookmark_manager_test" if ENV['RACK_ENV'] == "test"
		connection = PG.connect :dbname => db_name
		connection.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');"
		connection.close
	end

	

	private

	def url_checker(url)
		url =~ /\A#{URI::regexp(['http', 'https'])}\z/
	end

end
