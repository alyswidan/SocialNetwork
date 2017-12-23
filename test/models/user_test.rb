require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "feed should have the right posts" do
    michael = users(:michael)
    archer = users(:archer)
    lana  = users(:lana)
# Posts from followed user
    lana.posts.each do |post_following|
      assert michael.feed.include?(post_following)
    end
# Posts from self
    michael.posts.each do |post_self|
      assert michael.feed.include?(post_self)
    end
# Posts from unfollowed user
    archer.posts.each do |post_unfollowed|
      assert_not michael.feed.include?(post_unfollowed)
    end
  end
end
