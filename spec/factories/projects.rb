FactoryGirl.define do
  factory :project do
    title Faker::Lorem.characters(50)
  end

  factory :invalid_project, parent: :project do |f| 
    f.title Faker::Lorem.characters(52) 
  end

  factory :valid_project, parent: :project do |f| 
    f.title Faker::Lorem.characters(22) 
  end
end
