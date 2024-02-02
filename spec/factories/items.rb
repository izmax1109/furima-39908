FactoryBot.define do
  factory :item do
    commodity { 'Example Commodity' }
    description { 'Example Description' }
    category_id { Category.find_by(name: 'レディース').id }
    condition_id { Condition.find_by(name: '新品・未使用').id }
    payer_id { Payer.find_by(name: '着払い（購入者負担）').id }
    region_id { Region.find_by(name: '北海道').id }
    shipping_day_id { ShippingDay.find_by(name: '2〜3日で発送').id }
    price { 10_000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image_furima.png'), filename: 'test_image_furima.png')
    end
  end
end
