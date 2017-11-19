class CreateCharacteristics < ActiveRecord::Migration[5.1]
  def change
    create_table :characteristics do |t|
      t.string :name
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end
