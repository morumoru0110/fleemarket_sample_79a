class RenameCategoryColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :category, :category_id
  end
end
