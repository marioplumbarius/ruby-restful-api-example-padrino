FactoryGirl.define do
  factory :project do
    name { Faker::Name.name }
    kind { Faker::Number.between(0, Project.kinds.keys.size - 1) }
    release_date { Faker::Date.birthday.to_s }
    developer

    trait :invalid do
      name { nil }
    end
  end
end
