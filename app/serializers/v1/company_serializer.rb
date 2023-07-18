# frozen_string_literal: true

class CompanySerializer < ActiveModel::Serializer
  attributes :id
  attributes :name
  attributes :culture_type_id

  has_many :matched_applicants
end
