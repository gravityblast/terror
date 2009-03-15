require File.dirname(__FILE__) + '/spec_helper'

describe 'Creating posts' do
  include Sinatra::Test
  
  before do    
    @blank_post = Terror::Post.create
  end
  
  it 'should not be valid' do
    @blank_post.should_not be_valid
  end
  
  it 'should validate presence of title' do    
    @blank_post.errors.on(:title).should_not be_nil
  end
  
  it 'should validate presence of url' do    
    @blank_post.errors.on(:url).should_not be_nil
  end
  
  it 'should validate format of url' do    
    post = Terror::Post.create(:url => 'example.com')
    post.errors.on(:url).should_not be_nil
  end
    
  it 'should create post' do    
    post = Terror::Post.create(:url => 'http://example.com/', :title => 'Example')
    post.should be_valid
  end
end

describe 'Fetching feed' do
  it 'should fetch feed and create posts' do
    post_count = Terror::Post.count
    Terror::Post.fetch_all(File.dirname(__FILE__) + '/feeds/example.xml')
    Terror::Post.count.should == post_count + 2
  end
end