class AddAmountToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :amount, :integer, null: false
  end
end
