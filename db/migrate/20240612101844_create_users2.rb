class CreateUsers2 < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :image
      t.boolean :owner, default: false
      t.string :ip
      t.text :user_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

  end
end
