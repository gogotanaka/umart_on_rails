# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user_id 1
    menu_id 1
    amount 1
    priority 1
  end
end
