builder do |xml|
  xml.instruct! :xml, :version => '1.0'
  xml.feed :'xml-lang' => 'en-US', :xmlns => 'http://www.w3.org/2005/Atom' do
    xml.title Terror.config['terror']['title']
    xml.id 'http://localhost:4567'
    xml.link  :type => 'text/html',
              :href => 'http://localhost:4567',
              :rel  => 'alternate'
    xml.link  :type => 'application/atom+xml',
              :href => 'http://localhost:4567'    
    xml.updated(rfc_3339(@posts.first ? @posts.first.created_at : Time.now))
    @posts.each do |post|
      xml.entry do |entry|
        entry.id post.url
        entry.link  :type => 'text/html',
                    :href => post.url,
                    :rel  => 'alternate'
        entry.updated rfc_3339(post.created_at)
        entry.title post.title
        entry.author do |author|
          author.name post.source
        end
        entry.content post.url
      end
    end
  end
end