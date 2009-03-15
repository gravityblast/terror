module Terror
  module Helper
    def config
      Terror.config
    end
    
    def each_post
      @posts.each do |post|
        date = Date.parse(post.date.to_s)      
        yield(post, @current_date != date ? @current_date = date : nil)
      end
    end
    
    def rfc_3339(time)
      time.strftime("%Y-%m-%dT%H:%M:%SZ")
    end
    
    def newer_page?
      @posts.current_page > 1
    end
    
    def newer_page
      @posts.current_page - 1
    end
    
    def older_page?
      @posts.total_pages > @posts.current_page
    end
    
    def older_page
      @posts.current_page + 1
    end
    
  end
end