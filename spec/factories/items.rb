FactoryBot.define do
  factory :item do
    title { 'タイトル' }
    description { '説明' }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    prefecture_id { 2 }
    days_to_ship_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/output-image2.png'), filename: 'output-image2.png')
    end
  end
end
