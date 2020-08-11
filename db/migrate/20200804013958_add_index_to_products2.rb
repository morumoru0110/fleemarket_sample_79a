class AddIndexToProducts2 < ActiveRecord::Migration[6.0]
  def change
    add_index :products,  [:name, :brand]
  end
end
