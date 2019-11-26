require 'test_helper'

class KennelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kennels_index_url
    assert_response :success
  end

  test "should get show" do
    get kennels_show_url
    assert_response :success
  end

  test "should get new" do
    get kennels_new_url
    assert_response :success
  end

  test "should get create" do
    get kennels_create_url
    assert_response :success
  end

  test "should get edit" do
    get kennels_edit_url
    assert_response :success
  end

  test "should get update" do
    get kennels_update_url
    assert_response :success
  end

end
