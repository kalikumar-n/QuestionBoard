FactoryBot.define do
  factory :user do
    name { 'Factory Bot' }
    email { generate(:random_email) }
    active { true }
    password { generate(:password) }
  end

  sequence :random_email do |n|
    Faker::Internet.unique.email.gsub('@', "-#{n}@")
  end

  sequence :password do
    Faker::Internet.password(min_length: 8)
  end
end
