json.array!(@divelogs) do |divelog|
  json.extract! divelog, :id, :date, :point, :description, :picture, :latitude, :longitude
  json.url divelog_url(divelog, format: :json)
end
