FactoryBot.define do
  factory :post do
    author { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
  end
end