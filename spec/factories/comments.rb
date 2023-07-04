FactoryBot.define do
  factory :comment do
    title { Faker::Book.title }
    body { Faker::Book.title }
    author { association(:user) }
  end
end
