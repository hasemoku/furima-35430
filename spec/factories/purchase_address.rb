FactoryBot.define do
  factory :purchase_address do
    postal_code         { '000-0000' }
    delivery_source_id  { 35 }
    municipali          { '広島市安佐南区' }
    city_string         { '4-50-4' }
    bilding_name        { 'パークヒルズ304' }
    phone_number        { '09000000000' }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
