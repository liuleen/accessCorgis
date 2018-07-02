class CreateCorgis < ActiveRecord::Migration[5.1]
  def change
    create_table :corgis do |t|
      t.text :description
      t.integer :size
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.string :name
      t.string :image
      t.string :color

      t.timestamps
    end
  end
end
