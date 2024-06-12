class ChangeNameOfRandom < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :random, :ip
  end
end
