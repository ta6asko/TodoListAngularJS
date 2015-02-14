FactoryGirl.define do
  
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email { FactoryGirl.generate(:email) }
    password '12345678'
  end

end
