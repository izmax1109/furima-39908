FactoryBot.define do
  factory :record_address do
    postal_code { '276-0023' }
    region_id { 2 }
    city { '八千代市勝田台' }
    house_number { '7-10-8' }
    phone_number { '09092321082' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
