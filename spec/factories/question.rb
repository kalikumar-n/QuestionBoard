FactoryBot.define do

  factory :question do
    title { generate(:title) }
    description { generate(:description) }
    user {User.first}
  end

  sequence :title do
    Faker::Lorem.word
  end

  sequence :description do
    Faker::Lorem.paragraph
  end
end