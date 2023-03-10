class AddUserInformation < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street_name, :string
    add_column :users, :city, :string
    add_column :users, :postal_code, :string
    add_column :users, :country, :string
    add_column :users, :phone, :string
  end
end
