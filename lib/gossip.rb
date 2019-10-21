require 'csv'

class Gossip
	attr_accessor :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end

	def save
	  File.open("./db/gossip.csv", "ab") do |table|
		table.puts @author + ',' + @content
	end
end

def self.all
  all_gossips = []
  CSV.foreach("./db/gossip.csv") do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
end

def self.find(id)
	#Je souhaite qu'il m'affiche le premier potin mais dans un array, on commence à 0. Donc pour qu'il m'affiche bien
	#l'entrée que je souhaite, je retire 1
 	all[id.to_i - 1]
end	


end
