json.array!(@property_rental_requests) do |property_rental_request|
  json.extract! property_rental_request, :id
  json.url property_rental_request_url(property_rental_request, format: :json)
end
