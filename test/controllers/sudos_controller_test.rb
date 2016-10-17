require 'test_helper'

class SudosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sudo = sudos(:one)
  end

  test "should get index" do
    get sudos_url
    assert_response :success
  end

  test "should get new" do
    get new_sudo_url
    assert_response :success
  end

  test "should create sudo" do
    assert_difference('Sudo.count') do
      post sudos_url, params: { sudo: { description: @sudo.description, name: @sudo.name, sudo_rule: @sudo.sudo_rule } }
    end

    assert_redirected_to sudo_url(Sudo.last)
  end

  test "should show sudo" do
    get sudo_url(@sudo)
    assert_response :success
  end

  test "should get edit" do
    get edit_sudo_url(@sudo)
    assert_response :success
  end

  test "should update sudo" do
    patch sudo_url(@sudo), params: { sudo: { description: @sudo.description, name: @sudo.name, sudo_rule: @sudo.sudo_rule } }
    assert_redirected_to sudo_url(@sudo)
  end

  test "should destroy sudo" do
    assert_difference('Sudo.count', -1) do
      delete sudo_url(@sudo)
    end

    assert_redirected_to sudos_url
  end
end
