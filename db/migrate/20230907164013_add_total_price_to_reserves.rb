class AddTotalPriceToReserves < ActiveRecord::Migration[6.1]
  def change
    add_column :reserves, :total_price, :integer
  end
end
