FactoryBot.define do
  factory :match do
    association :applicant
    association :company
  end
end
