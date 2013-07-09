require 'sinatra'
require 'sinatra/reloader'

get "/form" do
	erb :form
end

get "/hello/:name" do
	params[:name]
end

get "/more/*/" do
	params[:splat]
end

get "/" do
	"Hello World"
end

get "/about" do
	"This is awesooome, I created a website."
end

get '/secret' do  
  erb :secret  
 end  

get '/decrypt/:secret' do  
  params[:secret].reverse  
 end 

post "/form" do
	"You said '#{params[:message]}'"
end

get '/time&&date' do
	time = Time.now 
	puts time
end

post "/time&&date" do
	"The time is '#{params[:time]}'"
end

post '/secret' do
	params[:secret].reverse
end

not_found do
	halt 404,'page not found'
end

