json.array!(@comments) do |comment|
  json.extract! comment, :id, :username, :content, :book_id
  json.url comment_url(comment, format: :json)
end
