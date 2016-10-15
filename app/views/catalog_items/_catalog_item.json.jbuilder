json.extract! catalog_item, :id, :name, :description, :created_at, :updated_at
json.url catalog_item_url(catalog_item, format: :json)