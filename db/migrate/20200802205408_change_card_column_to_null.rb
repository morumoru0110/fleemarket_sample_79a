class ChangeCardColumnToNull < ActiveRecord::Migration[6.0]
  def up
    # Not Null制約を外す場合　not nullを外したいカラム横にtrueを記載
    change_column_null :cards, :card_token, true
  end

  def down
    change_column_null :cards, :card_token, false
  end
end
