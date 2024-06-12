class CreateMigrationUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :migration_users do |t|
      t.text :name
      t.text :email
      t.text :image
      t.boolean :owner, default: false
      t.string :ip
      t.text :user_id
    
      t.timestamps
    end
  end
end
