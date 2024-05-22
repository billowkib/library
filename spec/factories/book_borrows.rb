FactoryBot.define do
  factory :book_borrow do
    association :book
    association :user
  end
end
