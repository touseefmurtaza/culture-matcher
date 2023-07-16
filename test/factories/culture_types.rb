# frozen_string_literal: true

FactoryBot.define do
  sequence(:culture_type_name) { |n| "Culture Type #{n}" }

  factory :culture_type do
    name { generate(:culture_type_name) }
  end
end
