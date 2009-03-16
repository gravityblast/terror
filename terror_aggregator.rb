$LOAD_PATH << File.join(Dir.getwd, 'lib')
require 'rubygems'
require 'sinatra'
require 'terror'
require 'date'

configure { Terror.init }
helpers   { include Terror::Helper }

set :root, File.dirname(__FILE__)

before do
  @posts = Terror::Post.paginate(:per_page => 20, :page => params[:page])  
end

get '/' do
  erb :index, :layout => !request.xhr?
end

get '/feed' do
  content_type :atom
  builder :feed
end