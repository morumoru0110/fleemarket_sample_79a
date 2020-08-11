class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :prefecture
      t.string :zip_code
      t.string :city
      t.string :street
      t.string :building_name
      t.string :room_number
      t.string :phone_number
      t.references :user, foreign_key: true
      t.string :last_name_kanji
      t.string :first_name_kanji
      t.string :last_name_kana
      t.string :first_name_kana

      t.timestamps
    end
  end
end
