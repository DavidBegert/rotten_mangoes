require 'test_helper'

class Admin::SessionControllerTest < ActionController::TestCase
  test "should get update" do
    get :update
    assert_response :success
  end

end
