require 'BookMark'

describe BookMark do

	it "add a bookmark database" do
		b1 = BookMark.create("http://www.bing.com", 'bing')
		expect(BookMark.all).to include b1.class
	end

	it 'varifying urls' do

		b1 = BookMark.create("invalid-website", 'invalde url')		
		expect(BookMark.all).not_to include b1.class
		
	end

	it 'passing a title' do
		b1 = BookMark.create("http://www.bing.com", 'bing2')
		expect(BookMark.all).to include b1.class
	end

	it '#delete' do
		b1 = BookMark.create('http://youtube.com', 'youtube')

		BookMark.delete(b1.id)	

		expect(BookMark.all).not_to include b1.class

	end

end