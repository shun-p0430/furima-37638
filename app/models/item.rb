class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price, numericality: { only_integer: true, message: 'invalid. Input half-width characters' }
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of setting range' }

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date
end
