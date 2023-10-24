class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :buyers
  has_many :orders

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠々]+\z/  }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠々]+\z/ }
  validates :first_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ }
  validates :last_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ }
  validates :birth_day, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/}

end
