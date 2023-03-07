class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :category
      t.string :name
      t.text :description
      t.string :address
      t.float :price

      t.timestamps
    end
  end
end
