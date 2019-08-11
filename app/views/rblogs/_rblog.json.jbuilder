json.extract! rblog, :id, :title, :content, :writer_id, :shared, :created_at, :updated_at
json.url rblog_url(rblog, format: :json)
