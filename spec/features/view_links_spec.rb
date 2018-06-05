feature 'viewing links' do
	scenario 'view links on the page' do
		visit('/')
		expect(page).to have_content('askjeeves.com')
		expect(page).to have_content('facebook.com')
		expect(page).to have_content('this.com')
	end
end

feature 'adding links' do
	# scenario 'adding a new link' do
	# 	visit('/')
	# 	fill_in 'bookmark', with: 'www.newwebsite.com'
	# end
end