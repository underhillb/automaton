require 'test_helper'

class BlueprintObjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blueprint_object = blueprint_objects(:one)
  end

  test "should get index" do
    get blueprint_objects_url
    assert_response :success
  end

  test "should get new" do
    get new_blueprint_object_url
    assert_response :success
  end

  test "should create blueprint_object" do
    assert_difference('BlueprintObject.count') do
      post blueprint_objects_url, params: { blueprint_object: { blueprint_id: @blueprint_object.blueprint_id, catalog_item_id: @blueprint_object.catalog_item_id, description: @blueprint_object.description, name: @blueprint_object.name, object_type_id: @blueprint_object.object_type_id, version: @blueprint_object.version } }
    end

    assert_redirected_to blueprint_object_url(BlueprintObject.last)
  end

  test "should show blueprint_object" do
    get blueprint_object_url(@blueprint_object)
    assert_response :success
  end

  test "should get edit" do
    get edit_blueprint_object_url(@blueprint_object)
    assert_response :success
  end

  test "should update blueprint_object" do
    patch blueprint_object_url(@blueprint_object), params: { blueprint_object: { blueprint_id: @blueprint_object.blueprint_id, catalog_item_id: @blueprint_object.catalog_item_id, description: @blueprint_object.description, name: @blueprint_object.name, object_type_id: @blueprint_object.object_type_id, version: @blueprint_object.version } }
    assert_redirected_to blueprint_object_url(@blueprint_object)
  end

  test "should destroy blueprint_object" do
    assert_difference('BlueprintObject.count', -1) do
      delete blueprint_object_url(@blueprint_object)
    end

    assert_redirected_to blueprint_objects_url
  end
end
