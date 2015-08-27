require 'json'
require 'new_relic/agent'
NewRelic::Agent.manual_start(:sync_startup => true)

task :demo do
	def adder(x,y)
		puts x + y
	end
	adder(50,5)
end

task :foo do
	contact
  def adder(x,y)
		puts x + y
	end
	adder(50,5)
end

task :bar do
	def adder(x,y)
		puts x + y
	end
	adder(50,5)
end