class AddInterestedToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :interested_amount, :integer, default: 0
  end
end
