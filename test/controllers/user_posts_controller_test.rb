require "test_helper"

class UserPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_post = user_posts(:one)
  end

  test "should get index" do
    get user_posts_url, as: :json
    assert_response :success
  end

  test "should create user_post" do
    assert_difference('UserPost.count') do
      post user_posts_url, params: { user_post: { post_id: @user_post.post_id, user_id: @user_post.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_post" do
    get user_post_url(@user_post), as: :json
    assert_response :success
  end

  test "should update user_post" do
    patch user_post_url(@user_post), params: { user_post: { post_id: @user_post.post_id, user_id: @user_post.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_post" do
    assert_difference('UserPost.count', -1) do
      delete user_post_url(@user_post), as: :json
    end

    assert_response 204
  end
end
