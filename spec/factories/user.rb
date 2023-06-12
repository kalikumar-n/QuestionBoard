FactoryBot.define do
  factory :user do
    active { true }
    name { Faker::Esport.player }
    email { generate(:random_email) }
    password { Faker::Internet.password(min_length: 8) }

    trait :inactive do
      active {false}
    end

    factory :inactive_user, traits: [:inactive]
  end

  sequence :random_email do |n|
    Faker::Internet.unique.email.gsub('@', "-#{n}@")
  end

end
