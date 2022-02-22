class AddDomainToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :domain, :string
  end
end
