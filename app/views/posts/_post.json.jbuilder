json.extract! post, :id, :title, :description, :url, :company_name, :job_type, :remote_ok, :location, :job_author, :created_at, :updated_at
json.url post_url(post, format: :json)
