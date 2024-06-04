class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :image
      t.boolean :owner

      t.timestamps
    end
  end
end
