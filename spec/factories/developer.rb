FactoryGirl.define do
  factory :developer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    age { Faker::Number.between(1, 100) }
    github { Faker::Internet.url }

    trait :invalid do
      name { nil }
      email { 'mariosouzaluangmailcom' }
      age { -1 }
      github { 'github.com' }
    end
  end
end
