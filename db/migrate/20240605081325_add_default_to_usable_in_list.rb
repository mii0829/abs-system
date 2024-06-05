class AddDefaultToUsableInList < ActiveRecord::Migration[7.1]
  def change
    change_column_default :lists, :usable, from: nil, to: "true"
  end
end
