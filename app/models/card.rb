class Card < ApplicationRecord
  belongs_to :user, optional: true

  validates :user_id, :card_token, :client_token, presence: true
end
