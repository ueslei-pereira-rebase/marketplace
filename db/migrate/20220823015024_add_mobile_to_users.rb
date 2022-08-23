class AddMobileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Mobile, :string
  end
end
