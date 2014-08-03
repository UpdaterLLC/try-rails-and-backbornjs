FactoryGirl.define do
  factory :todo do
    sequence(:what) { |i| "TODO #{i}" }
    urgency { rand(1..5) }
    priority { rand(1..5) }
  end
end
