# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "stevedanko1@gmail.com"
    password "12345678"
    password_confirmation "12345678"
    name "steve"
    phone_number "1234567890"
  end
end
