require 'feed_fetcher'

module Terror
  class Post
    include DataMapper::Resource
    include FeedFetcher
    
    property :id,     Integer,  :serial => true
    property :title,  String,   :nullable => false, :length => 255
    property :url,    String,   :nullable => false, :length => 255, :index => true, :format => /^http|https:\/\//
    property :source, String,   :length => 255
    property :date,   Time,     :nullable => false
    
    def self.paginate(options = {})
      per_page     = options[:per_page]
      page         = options[:page].to_i > 0 ? options[:page].to_i : 1
      posts        = self.all(:order => [:date.desc], :limit => per_page, :offset => per_page * (page - 1))            
      add_pagination_info(posts, per_page, page)
    end
  
    protected  
    
    def self.add_pagination_info(posts, per_page, page)
      posts.instance_eval do 
        class << self 
          attr_accessor :current_page, :total_pages
        end
      end
      posts.total_pages   = (self.count.to_f / per_page).ceil
      posts.current_page  = page
      posts
    end    
    
  end
end