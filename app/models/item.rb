class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  has_one_attached :days_to_ship
  has_one_attached :delivery_source
  has_one_attached :shipping_charge
  has_one_attached :image

  validates :product_name,  presence: true
  validates :description,   presence: true
  validates :price,         presence: true
  validates :image,         presence: true

  validates :condition_id,        numericality: { other_than: 1 }
  validates :category_id,         numericality: { other_than: 1 }
  validates :days_to_ship_id,     numericality: { other_than: 1 }
  validates :delivery_source_id,  numericality: { other_than: 1 }
  validates :shipping_charge_id,  numericality: { other_than: 1 }
end
