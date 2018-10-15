require 'test_helper'

class Api::TestingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_testings_index_url
    assert_response :success
  end

  test "should get show" do
    get api_testings_show_url
    assert_response :success
  end

end
