class AddAgreeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :agree, :boolean
  end
end
