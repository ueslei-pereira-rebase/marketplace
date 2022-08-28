class AddSubsidiaryToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subsidiary, :string
  end
end
