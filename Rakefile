require 'sinatra'
require File.dirname(__FILE__) + '/lib/terror'

namespace :feeds do
  desc 'Fetch all feeds'
  task :fetch do
    Terror.init
    Terror.config['feeds'].each do |url|
      Terror::Post.fetch(url)
    end
  end
end