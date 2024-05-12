FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
  end
end
