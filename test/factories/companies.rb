FactoryBot.define do
  factory :company do
    name { 'Test Company' }
    association :culture_type
  end
end
