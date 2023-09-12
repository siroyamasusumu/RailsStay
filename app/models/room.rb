class Room < ApplicationRecord
    has_many :reservations

    validates :name_room, {presence: true}
    validates :detail, {presence: true}
    validates :price, {presence: true}
    validates :address, {presence: true}
    mount_uploader :image_room, ImageUploader

    validate :price_check
    def price_check
        unless price.nil? || 0 < self.price then
            errors.add(:base, "一円以上にしてください")
        end
    end

    def self.ransackable_attributes(auth_object = nil)
        ["address", "created_at", "detail", "id", "image_room", "name_room", "price", "updated_at", "user_id"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["reservations"]
    end
    
end
