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
end
