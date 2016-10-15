require 'test_helper'

class ConfigurationDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuration_detail = configuration_details(:one)
  end

  test "should get index" do
    get configuration_details_url
    assert_response :success
  end

  test "should get new" do
    get new_configuration_detail_url
    assert_response :success
  end

  test "should create configuration_detail" do
    assert_difference('ConfigurationDetail.count') do
      post configuration_details_url, params: { configuration_detail: { configuration_detail_data: @configuration_detail.configuration_detail_data, configuration_detail_order: @configuration_detail.configuration_detail_order, configuration_detail_type_id: @configuration_detail.configuration_detail_type_id, configuration_template_id: @configuration_detail.configuration_template_id } }
    end

    assert_redirected_to configuration_detail_url(ConfigurationDetail.last)
  end

  test "should show configuration_detail" do
    get configuration_detail_url(@configuration_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_configuration_detail_url(@configuration_detail)
    assert_response :success
  end

  test "should update configuration_detail" do
    patch configuration_detail_url(@configuration_detail), params: { configuration_detail: { configuration_detail_data: @configuration_detail.configuration_detail_data, configuration_detail_order: @configuration_detail.configuration_detail_order, configuration_detail_type_id: @configuration_detail.configuration_detail_type_id, configuration_template_id: @configuration_detail.configuration_template_id } }
    assert_redirected_to configuration_detail_url(@configuration_detail)
  end

  test "should destroy configuration_detail" do
    assert_difference('ConfigurationDetail.count', -1) do
      delete configuration_detail_url(@configuration_detail)
    end

    assert_redirected_to configuration_details_url
  end
end
