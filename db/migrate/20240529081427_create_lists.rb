class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.text :name
      t.text :detail
      t.text :image
      t.boolean :usable

      t.timestamps
    end
  end
end
