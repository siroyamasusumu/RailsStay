class Room < ApplicationRecord
    validates :name_room, {presence: true}
    validates :detail, {presence: true}
    validates :price, {presence: true}
    validates :address, {presence: true}
    mount_uploader :image_room, ImageUploader
end
