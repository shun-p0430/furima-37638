class Destination < ApplicationRecord
  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :tel
  end

  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
