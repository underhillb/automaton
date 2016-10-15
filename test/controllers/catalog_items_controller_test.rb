require 'test_helper'

class CatalogItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catalog_item = catalog_items(:one)
  end

  test "should get index" do
    get catalog_items_url
    assert_response :success
  end

  test "should get new" do
    get new_catalog_item_url
    assert_response :success
  end

  test "should create catalog_item" do
    assert_difference('CatalogItem.count') do
      post catalog_items_url, params: { catalog_item: { description: @catalog_item.description, name: @catalog_item.name } }
    end

    assert_redirected_to catalog_item_url(CatalogItem.last)
  end

  test "should show catalog_item" do
    get catalog_item_url(@catalog_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_catalog_item_url(@catalog_item)
    assert_response :success
  end

  test "should update catalog_item" do
    patch catalog_item_url(@catalog_item), params: { catalog_item: { description: @catalog_item.description, name: @catalog_item.name } }
    assert_redirected_to catalog_item_url(@catalog_item)
  end

  test "should destroy catalog_item" do
    assert_difference('CatalogItem.count', -1) do
      delete catalog_item_url(@catalog_item)
    end

    assert_redirected_to catalog_items_url
  end
end
