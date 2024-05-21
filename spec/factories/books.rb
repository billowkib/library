FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    genre { Faker::Book }
    isbn { Faker::Code.isbn }
    quantity { Faker::Number.between(from: 0, to: 999) }
  end
end
