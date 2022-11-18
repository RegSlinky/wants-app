FactoryBot.define do
  factory :comment do
    comment {Faker::Lorem.characters(number:100)}
    association :user
    association :tweet
  end
end
