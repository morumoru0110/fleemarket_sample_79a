  require 'rails_helper'
describe Address do
  describe '#create' do
    it "zip_codeが空ならNG" do
      address = build(:address, zip_code: nil)
      address.valid?
      expect(address.errors[:zip_code]).to include("can't be blank")
    end
    it "prefectureが空ならNG" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end
    it "cityが空ならNG" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end
    it "streetが空ならNG" do
      address = build(:address, street: nil)
      address.valid?
      expect(address.errors[:street]).to include("can't be blank")
    end
    it "first_name_kanjiが空ならNG" do
      user = build(:user, first_name_kanji: nil)
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("can't be blank")
    end
    it "last_name_kanjiが空ならNG" do
      user = build(:user, last_name_kanji: nil)
      user.valid?
      expect(user.errors[:last_name_kanji]).to include("can't be blank")
    end
    it "first_name_kanaが空ならNG" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it "last_name_kanaが空ならNG" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
  end
end