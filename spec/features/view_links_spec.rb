
feature 'working with bookmark' do
	scenario 'view links on the page' do

		connection = PG.connect(dbname: 'bookmark_manager_test')
		connection.exec ("INSERT INTO bookmarks (url, title) VALUES ('http://makersacademy.com', 'MA');")
		connection.exec ("INSERT INTO bookmarks (url, title) VALUES ('http://facebook.com', 'FB');")
		connection.exec ("INSERT INTO bookmarks (url, title) VALUES ('http://twitter.com', 'TW');")
		connection.close
	

		visit('/')
		#save_and_open_page
		expect(page).to have_content('MA')
		expect(page).to have_content('FB')
		expect(page).to have_content('TW')
	end


end

feature 'adding links' do
	scenario 'adding a new link with title' do
		visit('/')
		fill_in 'url', with: 'http://www.milliondollarhomepage.com'
		fill_in 'title', with: 'MDHP'
		click_on "Add"
		expect(page).to have_content "MDHP"
	end

	scenario 'invalid urls' do
		visit('/')
		fill_in 'url', with: 'invalid-url'
		fill_in 'title', with: 'invalid-url'

		click_on "Add"

		expect(page).to have_content "Invalid url"
		
	end

end