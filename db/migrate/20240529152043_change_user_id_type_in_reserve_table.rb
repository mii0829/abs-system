class ChangeUserIdTypeInReserveTable < ActiveRecord::Migration[7.1]
  def change
    change_column :reserves, :user_id, :text
  end
end
