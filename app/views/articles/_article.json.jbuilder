json.extract! article, :id, :slug, :title, :summary, :body, :user_id, :site_id, :created_at, :updated_at
json.url article_url(article, format: :json)
