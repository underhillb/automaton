require 'test_helper'

class ConfigurationDetailTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuration_detail_type = configuration_detail_types(:one)
  end

  test "should get index" do
    get configuration_detail_types_url
    assert_response :success
  end

  test "should get new" do
    get new_configuration_detail_type_url
    assert_response :success
  end

  test "should create configuration_detail_type" do
    assert_difference('ConfigurationDetailType.count') do
      post configuration_detail_types_url, params: { configuration_detail_type: { description: @configuration_detail_type.description, name: @configuration_detail_type.name } }
    end

    assert_redirected_to configuration_detail_type_url(ConfigurationDetailType.last)
  end

  test "should show configuration_detail_type" do
    get configuration_detail_type_url(@configuration_detail_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_configuration_detail_type_url(@configuration_detail_type)
    assert_response :success
  end

  test "should update configuration_detail_type" do
    patch configuration_detail_type_url(@configuration_detail_type), params: { configuration_detail_type: { description: @configuration_detail_type.description, name: @configuration_detail_type.name } }
    assert_redirected_to configuration_detail_type_url(@configuration_detail_type)
  end

  test "should destroy configuration_detail_type" do
    assert_difference('ConfigurationDetailType.count', -1) do
      delete configuration_detail_type_url(@configuration_detail_type)
    end

    assert_redirected_to configuration_detail_types_url
  end
end
