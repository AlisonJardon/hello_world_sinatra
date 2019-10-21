

class Gossip
	attr_reader :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end

	def save
	  File.open("./db/gossip.csv", "ab") do |table|
		table.puts @author + ',' + @content
	end
end

end
