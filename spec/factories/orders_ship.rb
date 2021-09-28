FactoryBot.define do
  factory :order_ship do
    postalcode {'111-1111'}
    prefecture_id {2}
    city {'山田市'}
    address {'山田町'}
    phonenumber {'00000000000'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end