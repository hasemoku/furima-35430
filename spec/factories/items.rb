FactoryBot.define do
  factory :item do
    association :user
    product_name           { 'ぬいぐるみ' }
    description            { 'やわらかい肌触り' }
    category_id            { 2 }
    condition_id           { 2 }
    shipping_charge_id     { 2 }
    delivery_source_id     { 2 }
    days_to_ship_id        { 2 }
    price                  { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
