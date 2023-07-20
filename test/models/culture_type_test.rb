# frozen_string_literal: true

require 'test_helper'

class CultureTypeTest < ActiveSupport::TestCase
  def setup
    @culture_type = build(:culture_type)
  end

  test 'should be valid' do
    assert @culture_type.valid?
  end

  test 'name should be present' do
    @culture_type.name = ''
    assert @culture_type.invalid?
    assert_equal @culture_type.errors.full_messages.to_sentence, "Name can't be blank"
  end
end
