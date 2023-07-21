# frozen_string_literal: true

class Applicant < ApplicationRecord
  belongs_to :culture_type, optional: true
  has_many :matches, dependent: :destroy
  has_many :matched_companies, through: :matches, source: :company

  validates :culture_type, presence: true, on: %i[create update]
end
