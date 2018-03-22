require 'test_helper'

class InterfaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interface_index_url
    assert_response :success
  end

end
