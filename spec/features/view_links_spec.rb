
feature 'working with bookmark' do
	scenario 'view links on the page' do

		connection = PG.connect(dbname: 'bookmark_manager_test')
		connection.exec ("INSERT INTO bookmarks (url) VALUES ('http://makersacademy.com');")
		connection.exec ("INSERT INTO bookmarks (url) VALUES ('http://facebook.com');")
		connection.exec ("INSERT INTO bookmarks (url) VALUES ('http://twitter.com');")
		connection.close
	

		visit('/')
		expect(page).to have_content('http://makersacademy.com')
		expect(page).to have_content('http://facebook.com')
		expect(page).to have_content('http://twitter.com')
	end


end

feature 'adding links' do
	scenario 'adding a new link' do
		visit('/')
		fill_in 'bookmark', with: 'http://www.milliondollarhomepage.com'
		click_on "Add"
		expect(page).to have_content "milliondollarhomepage.com"
	end

	scenario 'invalid urls' do
		visit('/')
		fill_in 'bookmark', with: 'invalid-url'
		click_on "Add"
	
		expect(page).to have_content "Invalid url"
		
	end

end