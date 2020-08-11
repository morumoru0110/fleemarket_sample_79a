class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :products, :brand, null: true
  end

  def down
    change_column_null :products, :brand, null: false
  end
end
