require 'json'
require 'sinatra'
require 'net/http'
require 'newrelic_rpm'

newrelic_ignore '/front'

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
	sleep 3
	new_hash = {"message" => "hello world"}
	new_json = JSON.generate(new_hash)
	new_json 
end
# set :port, 9311

# get '/' do
# 	sleep 3
# 	'Hello world'
# end

# get '/test' do
# 	uri = URI('http://localhost:4567/test')
# 	100.times do 
# 		Net::HTTP.get(uri)
# 		print uri
# 	end
# end

# get '/test' do
# 	'testing'
# end

# get '/custom' do
# 	100.times do
# 	  number = rand(5)
# 	  ::NewRelic::Agent.record_metric('Custom/test/alert', number)
# 	  sleep(2)
# 	  puts Process.ppid
# 	  puts Process.pid
# 	end
# end

# get '/map' do
# 	uri = URI('http://127.0.0.1:4567')
# 	Net::HTTP.get(uri)
# end

get '/external' do
	uri = URI('http://www.usatoday.com')
	result = Net::HTTP.get(uri)
	::NewRelic::Agent.add_custom_attributes({full_uri: uri.to_s})
	[result]
end
