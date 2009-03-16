require 'rubygems'
require 'sinatra'
require 'sinatra/test'
require 'spec'
require 'spec/interop/test'

disable           :run
disable           :reload
set :environment, :test
set :root,        File.dirname(__FILE__) + '/../'

require File.dirname(__FILE__) + '/../terror_aggregator'