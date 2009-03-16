$LOAD_PATH << File.dirname(__FILE__) + '/terror'
require 'rubygems'
require 'dm-core'
require 'dm-more'
require 'sinatra'
require 'yaml'
require 'post'
require 'helper'

module Terror
  
  class << self
    attr_accessor :config
  end
  
  def self.root
    File.expand_path(File.dirname(__FILE__) + '/..')
  end
  
  def self.init(config = nil)
    self.config = config.nil? ? YAML.load_file(File.join(Sinatra::Application.root, 'config', 'terror.yml')) : config
    self.init_database
  end
  
  def self.init_database    
    init_database_connection
  end
  
  def self.init_database_connection
    DataMapper.setup(:default, self.config['database'][Sinatra::Application.environment.to_s])
    DataMapper.auto_upgrade!
  end
    
end