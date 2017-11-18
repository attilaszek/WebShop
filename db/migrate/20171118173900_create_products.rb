class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.float :promotion_price
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end
