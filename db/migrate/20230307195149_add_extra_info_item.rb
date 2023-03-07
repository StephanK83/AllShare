class AddExtraInfoItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :address
    add_column :items, :quantity, :integer
    add_column :items, :min_days_rent, :integer
    add_column :items, :postal_code, :string
  end
end
