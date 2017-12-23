require 'test_helper'

class AdvancedSearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advanced_search = advanced_searches(:one)
  end

  test "should get index" do
    get advanced_searches_url
    assert_response :success
  end

  test "should get new" do
    get new_advanced_search_url
    assert_response :success
  end

  test "should create advanced_search" do
    assert_difference('AdvancedSearch.count') do
      post advanced_searches_url, params: { advanced_search: { caption: @advanced_search.caption, email: @advanced_search.email, first_name: @advanced_search.first_name, hometown: @advanced_search.hometown, last_name: @advanced_search.last_name } }
    end

    assert_redirected_to advanced_search_url(AdvancedSearch.last)
  end

  test "should show advanced_search" do
    get advanced_search_url(@advanced_search)
    assert_response :success
  end

  test "should get edit" do
    get edit_advanced_search_url(@advanced_search)
    assert_response :success
  end

  test "should update advanced_search" do
    patch advanced_search_url(@advanced_search), params: { advanced_search: { caption: @advanced_search.caption, email: @advanced_search.email, first_name: @advanced_search.first_name, hometown: @advanced_search.hometown, last_name: @advanced_search.last_name } }
    assert_redirected_to advanced_search_url(@advanced_search)
  end

  test "should destroy advanced_search" do
    assert_difference('AdvancedSearch.count', -1) do
      delete advanced_search_url(@advanced_search)
    end

    assert_redirected_to advanced_searches_url
  end
end
