class AddColumntoReserve < ActiveRecord::Migration[7.1]
  def change
    add_column :reserves, :isRenting, :integer
  end
end
