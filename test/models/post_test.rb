require 'test_helper'

class PostTest < ActiveSupport::TestCase
    def setup
      @user = users(:michael)
# This code is not idiomatically correct.
      @Post = Post.new(caption: "Lorem ipsum", user_id: @user.id)
    end
    test "should be valid" do
      assert @Post.valid?
    end
    test "user id should be present" do
      @Post.user_id = nil
      assert_not @Post.valid?
    end
    test "caption should be at most 500 characters" do
      @Post.content = "a" * 501
      assert_not @Post.valid?
    end
  end

