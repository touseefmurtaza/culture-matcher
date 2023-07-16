require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  def setup
    @culture_type = create(:culture_type)
    @company = build(:company, culture_type: @culture_type)
  end

  test 'should be valid' do
    assert @company.valid?
  end

  test 'culture type should be present' do
    @company.culture_type = nil
    assert_not @company.valid?
  end
end
