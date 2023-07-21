# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :culture_type, optional: true
  has_many :matches, dependent: :destroy
  has_many :matched_applicants, through: :matches, source: :applicant

  validates :culture_type, presence: true, on: %i[create update]
end
