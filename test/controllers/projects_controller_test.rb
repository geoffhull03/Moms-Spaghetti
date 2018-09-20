require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get projects_resources_url
    assert_response :success
  end

end
