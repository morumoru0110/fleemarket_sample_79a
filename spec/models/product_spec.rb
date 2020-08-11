require 'rails_helper'

describe Product do
  describe '#create' do

    # 1. nameが空では登録できないこと
    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    # 2. descriptionが空では登録できないこと
    it "is invalid without a description" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    # 3. category_idが空では登録できないこと
    it "is invalid without a category_id" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    # 3. priceが空では登録できないこと
    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    # 4. conditionが空では登録できないこと
    it "is invalid without a condition" do
      product = build(:product, condition: nil)
      product.valid?
      expect(product.errors[:condition]).to include("can't be blank")
    end

    # 5. shipping_chargeが空では登録できないこと
    it "is invalid without a shipping_charge" do
      product = build(:product, shipping_charge: nil)
      product.valid?
      expect(product.errors[:shipping_charge]).to include("can't be blank")
    end

    # 6. shipping_areaが空では登録できないこと
    it "is invalid without a shipping_area" do
      product = build(:product, shipping_area: nil)
      product.valid?
      expect(product.errors[:shipping_area]).to include("can't be blank")
    end

    # 7. shipping_dayが空では登録できないこと
    it "is invalid without a shipping_day" do
      product = build(:product, shipping_day: nil)
      product.valid?
      expect(product.errors[:shipping_day]).to include("can't be blank")
    end



    # 8. nameが41文字以上であれば登録できないこと
    it "is invalid with a name that has more than 41 characters " do
      product = build(:product, name: "aaaaaaaaabaaaaaaaaabaaaaaaaaabaaaaaaaaaba")
      product.valid?
      expect(product.errors[:name]).to include("is too long (maximum is 40 characters)")
    end
  end
end