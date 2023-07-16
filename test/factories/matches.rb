# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    association :applicant
    association :company
  end
end
