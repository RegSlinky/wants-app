FactoryBot.define do
  factory :tweet do
    artist {Faker::Name.initials(number: 40)}
    text {Faker::Lorem.characters(number:140)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
