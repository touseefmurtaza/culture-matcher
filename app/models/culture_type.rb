class CultureType < ApplicationRecord
  has_many :applicants
  has_many :companies

  validates :name, presence: true
end
