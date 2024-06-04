class CreateReserves < ActiveRecord::Migration[7.1]
  def change
    create_table :reserves do |t|
      t.integer :user_id
      t.date :start
      t.date :end
      t.integer :list_id

      t.timestamps
    end
  end
end
