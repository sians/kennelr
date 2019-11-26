require 'test_helper'

class DogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dog_index_url
    assert_response :success
  end

  test "should get show" do
    get dog_show_url
    assert_response :success
  end

  test "should get new" do
    get dog_new_url
    assert_response :success
  end

  test "should get create" do
    get dog_create_url
    assert_response :success
  end

  test "should get edit" do
    get dog_edit_url
    assert_response :success
  end

  test "should get update" do
    get dog_update_url
    assert_response :success
  end

end
