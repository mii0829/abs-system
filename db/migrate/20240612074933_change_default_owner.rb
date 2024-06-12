class ChangeDefaultOwner < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :owner, from: nil, to: 0
  end
end
