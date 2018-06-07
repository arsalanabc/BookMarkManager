require 'BookMark'

describe BookMark do

	it "add a bookmark database" do
		subject.create("http://www.bing.com", 'bing')
		expect(subject.all.values.last).to include "http://www.bing.com"
	end

	it 'varifying urls' do

		subject.create("invalid-website", 'invalde url')		
		expect(subject.all).not_to include ("invalid-website")
		
	end

	it 'passing a title' do
		subject.create("http://www.bing.com", 'bing2')
		expect(subject.all.values.last).to include 'bing2'
	end



end