class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :apartment, :tel, :purchase_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/, message: "is too short" }
    validates :item_id
    validates :user_id
  end
  validates :tel, format: { with: /\A\d\z/, message: "is invalid. Input only number"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, tel: tel, purchase_id: purchase.id)
  end
end