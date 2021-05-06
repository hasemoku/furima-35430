class PurchaseAddress
  extend ActiveHash::Associations::ActiveRecordExtensions
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_source_id, :municipali, :city_string, :bilding_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :city_string
    validates :phone_number
    validates :delivery_source_id, numericality: { other_than: 1 }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  with_options presence: true,
               format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'Full-width characters' } do
    validates :municipali
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_source_id: delivery_source_id, municipali: municipali, city_string: city_string, bilding_name: bilding_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end