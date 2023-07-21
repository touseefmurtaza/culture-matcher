# frozen_string_literal: true

class CultureType < ApplicationRecord
  has_many :applicants, dependent: :nullify
  has_many :companies, dependent: :nullify

  validates :name, presence: true
end
