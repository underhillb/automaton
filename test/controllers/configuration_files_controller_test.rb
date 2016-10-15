require 'test_helper'

class ConfigurationFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuration_file = configuration_files(:one)
  end

  test "should get index" do
    get configuration_files_url
    assert_response :success
  end

  test "should get new" do
    get new_configuration_file_url
    assert_response :success
  end

  test "should create configuration_file" do
    assert_difference('ConfigurationFile.count') do
      post configuration_files_url, params: { configuration_file: { configuration_template_id: @configuration_file.configuration_template_id, file_content: @configuration_file.file_content, version: @configuration_file.version } }
    end

    assert_redirected_to configuration_file_url(ConfigurationFile.last)
  end

  test "should show configuration_file" do
    get configuration_file_url(@configuration_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_configuration_file_url(@configuration_file)
    assert_response :success
  end

  test "should update configuration_file" do
    patch configuration_file_url(@configuration_file), params: { configuration_file: { configuration_template_id: @configuration_file.configuration_template_id, file_content: @configuration_file.file_content, version: @configuration_file.version } }
    assert_redirected_to configuration_file_url(@configuration_file)
  end

  test "should destroy configuration_file" do
    assert_difference('ConfigurationFile.count', -1) do
      delete configuration_file_url(@configuration_file)
    end

    assert_redirected_to configuration_files_url
  end
end
