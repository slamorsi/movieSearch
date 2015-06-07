json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :title, :imdb_id
  json.url favorite_url(favorite, format: :json)
end
