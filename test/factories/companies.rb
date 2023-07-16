# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { 'Test Company' }
    association :culture_type
  end
end
