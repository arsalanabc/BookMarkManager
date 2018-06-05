
feature 'viewing links' do
	scenario 'view links on the page' do

		connection = PG.connect(dbname: 'bookmark_manager_test')
		connection.exec ("INSERT INTO bookmarks (url) VALUES ('makersacademy.com');")
		connection.exec ("INSERT INTO bookmarks (url) VALUES ('facebook.com');")
		connection.exec ("INSERT INTO bookmarks (url) VALUES ('twitter.com');")
		connection.close
	

		visit('/')
		expect(page).to have_content('makersacademy.com')
		expect(page).to have_content('facebook.com')
		expect(page).to have_content('twitter.com')
	end
end

feature 'adding links' do
	# scenario 'adding a new link' do
	# 	visit('/')
	# 	fill_in 'bookmark', with: 'www.newwebsite.com'
	# end
end