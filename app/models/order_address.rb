class OrderAddress
  include ActiveModel::Model
  attr_accessor :order_id, :post_code, :prefectures_id, :city, :city_address, :building_name, :telephone, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :city
    validates :city_address
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(order_id: order.id, post_code:, prefectures_id:, city:,
                   city_address:, building_name:, telephone:)
  end
end
