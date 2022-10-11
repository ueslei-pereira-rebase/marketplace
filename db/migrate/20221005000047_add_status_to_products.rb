class AddStatusToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :status, :integer, null: false, default: 0
    add_reference :products, :user, null: false, foreign_key: true
  end
end
