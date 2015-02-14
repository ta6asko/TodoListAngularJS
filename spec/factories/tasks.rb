FactoryGirl.define do
  factory :task do
    title    Faker::Name.title
    deadline Faker::Date.between(2.days.ago, Date.today)
    
  end

  factory :invalid_task, parent: :task do |f| 
    f.title '' 
  end

end
