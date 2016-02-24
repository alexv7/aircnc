json.array!(@rental_requests) do |rental_request|
  json.extract! rental_request, :id
  json.url rental_request_url(rental_request, format: :json)
end
