FactoryBot.define do
  factory :applicant do
    first_name { 'John' }
    last_name { 'Doe' }
    association :culture_type
  end
end
