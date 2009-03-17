require 'rubygems'
require 'feed-normalizer'
require 'open-uri'

module Terror
  module FeedFetcher
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def fetch_all(url)
        feed = FeedNormalizer::FeedNormalizer.parse(open(url))
        feed.entries.each{|entry| create_from_entry(feed, entry)}
      end
      
      def create_from_entry(feed, entry)
        self.create(
          :title => entry.title, 
          :url => entry.url, 
          :source => feed.title, 
          :date => entry.date_published
        )  unless self.first(:url => entry.url)
      end
    end
    
  end
end