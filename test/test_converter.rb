require 'rubygems'
require 'sinatra/test/unit'
require File.join(File.dirname(__FILE__), '..', 'converter')

class TestShortener < Test::Unit::TestCase
  
  configure do
    set :views => File.join(File.dirname(__FILE__), '..',
'views')
  end

  def test_home_renders_content
    get '/'
    
    assert_equal 200, @response.status
    assert @response.body.length > 0
  end
  
end
