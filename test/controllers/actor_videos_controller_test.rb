require 'test_helper'

class ActorVideosControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get actor_videos_destroy_url
    assert_response :success
  end

end
