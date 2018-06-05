require 'BookMark'


xdescribe BookMark do

	it '#all' do 
		url_list = ['www.askjeeves.com', 'www.facebook.com', 'www.this.com']

		expect(subject.all).to eq (url_list) 

	end


end