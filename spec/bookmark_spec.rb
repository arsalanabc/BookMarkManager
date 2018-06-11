require 'BookMark'

describe BookMark do

	it "add a bookmark database" do

		b1 = BookMark.create("http://www.bing.com", 'bing')
		b2 = BookMark.create('http://youtube.com', 'youtube')
		expect(BookMark.all).to include b1
	end

	it 'varifying urls' do

		b1 = BookMark.create("invalid-website", 'invalde url')		
		expect(BookMark.all).not_to include b1
		
	end

	it 'passing a title' do
		b1 = BookMark.create("http://www.bing.com", 'bing2')
		expect(BookMark.all).to include b1
	end

	it '#delete' do
		b1 = BookMark.create('http://youtube.com', 'youtube')

		BookMark.delete(b1.id)	

		expect(BookMark.all).not_to include b1.class

	end

	it '#==' do
		b1 = BookMark.new(1, "http://this.com", "this")
		b2 = BookMark.new(2, "http://this.com", "that")

		expect(b1).to eq b2
	end 

	it "#update" do
		

		b1 = BookMark.create("http://www.bing.com", 'bing')
		
		b1 = BookMark.update(b1.id, "http://www.wikileaks.com", 'WL' )
		
		expect(b1.title).to eq 'WL'

	end
end