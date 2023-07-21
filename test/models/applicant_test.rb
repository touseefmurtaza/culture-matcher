# frozen_string_literal: true

require 'test_helper'

class ApplicantTest < ActiveSupport::TestCase
  def setup
    @culture_type = create(:culture_type)
    @applicant = build(:applicant, culture_type: @culture_type)
  end

  test 'should be valid' do
    assert @applicant.valid?
  end

  test 'culture type should be present' do
    @applicant.culture_type = nil
    assert @applicant.invalid?
    assert_equal @applicant.errors.full_messages.to_sentence, "Culture type can't be blank"
  end
end
