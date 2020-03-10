require 'test_helper'

class JourneysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get journeys_create_url
    assert_response :success
  end

end
