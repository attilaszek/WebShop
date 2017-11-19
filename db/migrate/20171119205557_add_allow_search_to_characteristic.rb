class AddAllowSearchToCharacteristic < ActiveRecord::Migration[5.1]
  def change
    add_column :characteristics, :allow_search, :boolean
  end
end
