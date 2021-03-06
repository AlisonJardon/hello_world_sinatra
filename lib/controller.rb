require 'gossip'

class ApplicationController < Sinatra::Base
  
	get '/' do
  erb :index, locals: {gossips: Gossip.all}
	end

  get '/gossips/new/' do
  	erb :new_gossip
  end

	post '/gossips/new/' do
		Gossip.new(params["gossip_author"], params["gossip_content"]).save
	redirect '/'
	end

get '/gossips/:id' do
	erb :show, locals: {find_gossip: params["id"], wanted_gossip: Gossip.find(params["id"])}
	#Je définis plusieurs variables que je vais appeler dans mon fichier show
end

end