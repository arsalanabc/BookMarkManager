require 'pg'

def truncate_test_db
	connection = PG.connect(dbname: 'bookmark_manager_test')
	connection.exec ("TRUNCATE bookmarks;")
	connection.close
end