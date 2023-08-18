class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name_room
      t.text :detail
      t.integer :price
      t.string :address
      t.string :image_room
      t.integer :user_id

      t.timestamps
    end
  end
end
