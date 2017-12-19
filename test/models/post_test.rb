require 'test_helper'

class PostTest < ActiveSupport::TestCase
    def setup
      @user = users(:michael)
# This code is not idiomatically correct.
      @post = Post.new(caption: "Lorem ipsum", user_id: @user.id)
    end
    test "should be valid" do
      assert @post.valid?
    end
    test "user id should be present" do
      @post.user_id = nil
      assert_not @post.valid?
    end
    test "caption should be at most 500 characters" do
      @post.caption = "a" * 501
      assert_not @post.valid?
    end
    test "order should be most recent first" do
      assert_equal Post.first,posts(:most_recent)
    end

  end

