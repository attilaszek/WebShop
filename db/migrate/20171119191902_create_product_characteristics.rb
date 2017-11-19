class CreateProductCharacteristics < ActiveRecord::Migration[5.1]
  def change
    create_table :product_characteristics do |t|
      t.string :name
      t.references :product, foreign_key: true
      t.references :characteristic, foreign_key: true

      t.timestamps
    end
  end
end
