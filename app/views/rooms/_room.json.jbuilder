json.extract! room, :id, :user_id, :room_image, :room_name, :introduce, :price, :address, :created_at, :updated_at
json.url room_url(room, format: :json)
