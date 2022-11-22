FactoryBot.define do
  factory :item do
    partner_nickname {Faker::Name.initials(number: 10)}
    artist {Faker::Name.initials(number: 40)}
    title {Faker::Lorem.characters(number:140)}
    price {400}

    shipping_fee_status_id {2}
    prefecture_id {2}
    association :user
    association :tweet

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
