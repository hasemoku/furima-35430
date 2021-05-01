class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :delivery_source
  belongs_to :shipping_charge
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :product_name
    validates :description
    validates :price
    validates :image
  end

  validates :price, inclusion: { in: (300..9_999_999) }

  with_options numericality: { other_than: 1 } do
    validates :condition_id
    validates :category_id
    validates :days_to_ship_id
    validates :delivery_source_id
    validates :shipping_charge_id
  end
end
