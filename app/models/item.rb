class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price
  end

  belongs_to :user
end
