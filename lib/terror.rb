$LOAD_PATH << File.dirname(__FILE__) + '/terror'
require 'rubygems'
require 'activerecord'
require 'yaml'
require 'post'
require 'helper'

module Terror
  
  class << self
    attr_accessor :config
  end
  
  def self.init(config = nil)
    self.config = config.nil? ? YAML.load_file(File.dirname(__FILE__) + '/../config/terror.yml') : config
    self.init_database
  end
  
  def self.init_database    
    init_database_connection
    init_database_tables
  end
  
  def self.init_database_connection
    ActiveRecord::Base.establish_connection(self.config['database'][Sinatra::Application.environment.to_s])
  end
  
  def self.init_database_tables
    ActiveRecord::Schema.define do
      create_table :posts do |t|
        t.string    :title
        t.string    :source
        t.string    :url   
        t.datetime  :date
        t.datetime  :created_at
      end
      add_index :posts, :url
      add_index :posts, :date
    end
  rescue ActiveRecord::StatementInvalid
    # tables already exist
  end
  
end