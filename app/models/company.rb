# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :culture_type
  has_many :matches
  has_many :matched_applicants, through: :matches, source: :applicant

  validates :culture_type, presence: true
end
