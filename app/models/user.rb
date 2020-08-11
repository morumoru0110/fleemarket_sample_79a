class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :products
  has_many :favs, dependent: :destroy
  has_many :faved_produtcs, through: :favs, source: :product
  has_one :address, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :products
  has_many :sns_credentials, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :nickname, presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birthday, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_initialize
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  def already_liked?(product)
    self.likes.exists?(product_id: product.id)
  end

  def fav_by?(product)
    favs.where(product_id: product.id).exists?
  end
  
end
