class AddIndexToCategories < ActiveRecord::Migration[6.0]
  def change
    add_index :categories, :category
  end
end
