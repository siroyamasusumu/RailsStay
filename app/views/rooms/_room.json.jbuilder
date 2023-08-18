json.extract! room, :id, :name_room, :detail, :price, :address, :image_room, :user_id, :created_at, :updated_at
json.url room_url(room, format: :json)
