json.array!(@listings) do |listing|
  json.extract! listing, :address, :price, :number_of_roomates, :notes
  json.url listing_url(listing, format: :json)
end
