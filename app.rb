require 'json'
require 'sinatra'
require 'net/http'
require 'newrelic_rpm'

# newrelic_ignore '/front'

get '/test/:name' do
	"Hello #{params['name']}"
end

get '/hi' do
	#{"foo" => "bar", "one" => "two"}
	#["Hey there"]
	uri = URI('http://localhost:8080/bye')
	Net::HTTP.get(uri)
end

get '/end' do
	my_hash = {"month" => "august"}
	my_json = JSON.generate(my_hash)
	my_json
end

get '/front' do
	uri = URI('http://localhost:4567/back')
	Net::HTTP.get(uri)
end

get '/back' do
	new_hash = {"message" => "hello world"}
	new_json = JSON.generate(new_hash)
	new_json 
end

get '/external' do
	uri = URI('http://www.usatoday.com')
	result = Net::HTTP.get(uri)
	::NewRelic::Agent.add_custom_attributes({full_uri: uri.to_s})
	[result]
end
