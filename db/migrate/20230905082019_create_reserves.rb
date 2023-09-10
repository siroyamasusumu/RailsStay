class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|
      t.date :start_date
      t.date :end_date
      t.integer :people
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
