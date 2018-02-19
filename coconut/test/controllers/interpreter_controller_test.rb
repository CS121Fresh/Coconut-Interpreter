require 'test_helper'

class InterpreterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interpreter_index_url
    assert_response :success
  end

end
