class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :buyers
  # has_many :orders

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ }
  validates :first_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true
  validates :password, format: {  with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
end
