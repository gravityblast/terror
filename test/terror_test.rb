require File.dirname(__FILE__) + '/spec_helper'

describe 'Test' do
  include Sinatra::Test    
  
  it 'should show posts' do
    get '/'
    response.should be_ok
  end
  
  it 'should show feed' do
    get '/feed'
    response.should be_ok
    response.content_type.should == 'application/atom+xml'    
  end
  
end