json.array!(@predictions) do |prediction|
  json.extract! prediction, :id
  json.url prediction_url(prediction, format: :json)
end
