require 'feed_fetcher'

module Terror
  class Post < ActiveRecord::Base
    include FeedFetcher
    
    validates_presence_of :title, :url
    validates_format_of   :url, :with => /^http|https:\/\//
    
    def self.paginate(options = {})
      per_page     = options[:per_page]
      page         = options[:page].to_i > 0 ? options[:page].to_i : 1
      posts        = self.find(:all, :order => 'date DESC', :limit => per_page, :offset => per_page * (page - 1))            
      add_pagination_info(posts, per_page, page)
    end
  
    protected  
    
    def self.add_pagination_info(posts, per_page, page)
      posts.class_eval { attr_accessor :current_page, :total_pages }      
      posts.total_pages   = (self.count.to_f / per_page).ceil
      posts.current_page  = page
      posts
    end    
    
  end
end