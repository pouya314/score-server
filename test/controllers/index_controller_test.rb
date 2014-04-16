require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get status" do
    get :status
    assert_response :success
  end

  test "should get chart" do
    get :chart
    assert_response :success
  end

  test "should get screen" do
    get :screen
    assert_response :success
  end

end
