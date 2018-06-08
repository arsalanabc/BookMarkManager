feature 'delete bookmark' do
	scenario 'deleting a bookmark from database' do
		

		bookmark = BookMark.create("https://test.com", 'test')
		

		visit('/')
		#save_and_open_page
		within "#bookmark-#{bookmark.id}" do
      		click_on 'Delete'
    	end
		
		
		expect(page).not_to have_content('test')

	end
end