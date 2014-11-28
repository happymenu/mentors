require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  def test_index
    get 'index'
    #assert(response.code == '2014', 'my customized message')
    assert_equal response.code, '2014'
    response.code.should == '2014'
  end
  #def test_index_post
  #  post 'index'
  #  assert response.code == '2014'
  #end
end
