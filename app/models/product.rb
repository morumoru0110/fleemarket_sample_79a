class Product < ApplicationRecord
  belongs_to :user , optional: true
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favs, dependent: :destroy
  has_many :faved_users, through: :favs, source: :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  
  validates :name, :description, :category_id, :price, :condition, :shipping_charge, :shipping_area, :shipping_day, :images, presence: true
  validates :name, length: { maximum: 40 }
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :shipping_charge, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 2}
  validates :shipping_day, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 7}
  accepts_nested_attributes_for :images, allow_destroy: true
end
