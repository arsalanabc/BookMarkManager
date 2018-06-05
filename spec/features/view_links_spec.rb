feature 'viewing links' do
	

	scenario 'view links on the page' do
		
		
		visit('/')

		expect(page).to have_content('www.askjeeves.com')
		expect(page).to have_content('www.facebook.com')
		expect(page).to have_content('www.this.com')
	end
end

feature 'adding links' do
	scenario 'adding a new link' do
		visit('/')
		fill_in 'bookmark', with: 'www.newwebsite.com'


	end


end