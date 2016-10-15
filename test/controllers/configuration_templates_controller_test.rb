require 'test_helper'

class ConfigurationTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuration_template = configuration_templates(:one)
  end

  test "should get index" do
    get configuration_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_configuration_template_url
    assert_response :success
  end

  test "should create configuration_template" do
    assert_difference('ConfigurationTemplate.count') do
      post configuration_templates_url, params: { configuration_template: { blueprint_objects_id: @configuration_template.blueprint_objects_id, description: @configuration_template.description, name: @configuration_template.name } }
    end

    assert_redirected_to configuration_template_url(ConfigurationTemplate.last)
  end

  test "should show configuration_template" do
    get configuration_template_url(@configuration_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_configuration_template_url(@configuration_template)
    assert_response :success
  end

  test "should update configuration_template" do
    patch configuration_template_url(@configuration_template), params: { configuration_template: { blueprint_objects_id: @configuration_template.blueprint_objects_id, description: @configuration_template.description, name: @configuration_template.name } }
    assert_redirected_to configuration_template_url(@configuration_template)
  end

  test "should destroy configuration_template" do
    assert_difference('ConfigurationTemplate.count', -1) do
      delete configuration_template_url(@configuration_template)
    end

    assert_redirected_to configuration_templates_url
  end
end
