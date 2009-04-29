$LOAD_PATH << File.join(Dir.getwd, 'lib')
require "rubygems"
require "sinatra"
require "convert"

before do
  @final = Converter.new()
end

get "/" do
  erb :home
end

post "/convert" do
  @final = Converter.new(params['dec'], params['ra'])
  redirect "/show/#{@final.dec}/#{@final.ra}"
end

get "/show/:dec/:ra" do
  erb :converted
end
  