FactoryBot.define do
  factory :user do
    email { 'tonnytei4@gmail.com' }
    password { 'Danger123' }
    password_confirmation { 'Danger123' }
  end
end
