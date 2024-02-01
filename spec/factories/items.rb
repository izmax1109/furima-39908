FactoryBot.define do
  factory :item do
    image {}
    commodity { 'Example Commodity' }
    description { 'Example Description' }
    category { Category.find_by(name: 'レディース') }
    condition { Condition.find_by(name: '新品・未使用') }
    payer { Payer.find_by(name: '着払い（購入者負担）') }
    region { Region.find_by(name: '北海道') }
    shipping_day { ShippingDay.find_by(name: '2〜3日で発送') }
    price { 10_000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image_furima.png'), filename: 'test_image_furima.png')
    end
  end
end
