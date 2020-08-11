require 'rails_helper'

describe Card do
  describe '#create' do
    # 1. user_idが空では登録できないこと
    it "is invalid without a user_id" do
      card = build(:card, user_id: nil)
      card.valid?
      expect(card.errors[:user_id]).to include("can't be blank")
    end
    # 2. card_tokenが空では登録できないこと
    it "is invalid without a card_token" do
      card = build(:card, card_token: nil)
      card.valid?
      expect(card.errors[:card_token]).to include("can't be blank")
    end
    # 3. client_tokenが空では登録できないこと
    it "is invalid without a client_token" do
      card = build(:card, client_token: nil)
      card.valid?
      expect(card.errors[:client_token]).to include("can't be blank")
    end
  end
end
