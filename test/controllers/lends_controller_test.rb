require 'test_helper'

class LendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lends_index_url
    assert_response :success
  end

end
