# frozen_string_literal: true

require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  def setup
    @applicant = create(:applicant)
    @company = create(:company)
    @match = build(:match, applicant: @applicant, company: @company)
  end

  test 'should be valid' do
    assert @match.valid?
  end

  test 'should be invalid when applicant_id is nil' do
    @match.applicant_id = nil
    assert @match.invalid?
  end

  test 'should be invalid when company_id is nil' do
    @match.company_id = nil
    assert @match.invalid?
  end
end
