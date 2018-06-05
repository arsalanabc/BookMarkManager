require 'BookMark'

describe BookMark do

	it "should add a bookmark to the database" do
		subject.create("www.bing.com")
		expect(subject.all).to include "www.bing.com"
	end


end