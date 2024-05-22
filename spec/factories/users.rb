FactoryBot.define do
  factory :user do
    initialize_with { type&.present? ? type.constantize.new : User.new }

    password { 'password' }
    email { 'librarian@email.com' }
    
    trait :librarian do
      role { :Librarian }
      username { 'librarian_user' }
      type { "Librarian" }
    end
    
    trait :member do
      role { :Member }
      username { 'member_user' }
      type { "Member" }
    end
  end
end
