class ChangeUserDat < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :user_id, :text
  end
end
