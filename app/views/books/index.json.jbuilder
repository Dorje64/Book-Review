json.array!(@books) do |book|
  json.extract! book, :id, :name, :author, :description, :category, :like, :dislike
  json.url book_url(book, format: :json)
end
