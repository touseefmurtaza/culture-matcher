# frozen_string_literal: true

class Applicant < ApplicationRecord
  belongs_to :culture_type

  validates :culture_type, presence: true
end
