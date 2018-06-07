require 'BookMark'

describe BookMark do

	it "should add a bookmark to the database" do
		subject.create("http://www.bing.com")
		expect(subject.all).to include "http://www.bing.com"
	end

	it 'varifying urls' do

		subject.create("invalid-website")		
		expect(subject.all).not_to include ("invalid-website")
		
	end

end