FactoryBot.define do

  factory :question do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    user
  end

end