require "test_helper"

class Api::V1::ManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_manager = api_v1_managers(:one)
  end

  test "should get index" do
    get api_v1_managers_url, as: :json
    assert_response :success
  end

  test "should create api_v1_manager" do
    assert_difference("Api::V1::Manager.count") do
      post api_v1_managers_url, params: { api_v1_manager: { first_name: @api_v1_manager.first_name, last_name: @api_v1_manager.last_name, notes: @api_v1_manager.notes } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_manager" do
    get api_v1_manager_url(@api_v1_manager), as: :json
    assert_response :success
  end

  test "should update api_v1_manager" do
    patch api_v1_manager_url(@api_v1_manager), params: { api_v1_manager: { first_name: @api_v1_manager.first_name, last_name: @api_v1_manager.last_name, notes: @api_v1_manager.notes } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_manager" do
    assert_difference("Api::V1::Manager.count", -1) do
      delete api_v1_manager_url(@api_v1_manager), as: :json
    end

    assert_response :no_content
  end
end
