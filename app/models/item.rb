class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order

  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :prefectures
  belongs_to :shoppingcharge
  belongs_to :shoppingdays

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :shopping_charge_id, presence: true, numericality: { other_than: 1 }
  validates :shopping_days_id, presence: true, numericality: { other_than: 1 }
  validates :prefectures_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, format: { with: /\A\d+\z/, message: 'は半角数字のみ入力してください' },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
