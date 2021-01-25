FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {'111111'}
    password_confirmation { password }
    date                  {'1990/1/1'}
  end
end
