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
    assert_not @culture_type.valid?
  end
end
