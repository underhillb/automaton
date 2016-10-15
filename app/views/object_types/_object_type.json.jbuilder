json.extract! object_type, :id, :name, :description, :created_at, :updated_at
json.url object_type_url(object_type, format: :json)