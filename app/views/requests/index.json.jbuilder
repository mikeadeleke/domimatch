json.array!(@requests) do |request|
  json.extract! request, :price_range, :type_of_house, :term
  json.url request_url(request, format: :json)
end