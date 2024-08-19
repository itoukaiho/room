json.extract! reservation, :id, :room_id, :start_date, :end_date, :people, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
