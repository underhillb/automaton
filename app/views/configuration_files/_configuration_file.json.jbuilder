json.extract! configuration_file, :id, :configuration_template_id, :version, :file_content, :created_at, :updated_at
json.url configuration_file_url(configuration_file, format: :json)