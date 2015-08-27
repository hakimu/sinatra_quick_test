require 'net/http'

uri = URI('http://localhost:4567/test')

600.times do
	Net::HTTP.get(uri)
	sleep 1
end

