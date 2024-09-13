FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    description { Faker::Commerce.department }
    price { Faker::Commerce.price }
    association :category
  end
end