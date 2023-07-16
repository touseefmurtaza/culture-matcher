require 'test_helper'

module Api
  module V1
    class CompaniesControllerTest < ActionDispatch::IntegrationTest
      setup do
        @company = create(:company)
      end

      test 'should get index' do
        get api_v1_companies_url
        assert_response :success
      end

      test 'should show company' do
        get api_v1_company_url(@company)
        assert_response :success
      end

      test 'should create company' do
        assert_difference -> { Company.count(:id) }, +1 do
          post api_v1_companies_url, params: { company: { name: 'New Company', culture_type_id: create(:culture_type).id } }
        end

        assert_response :created
      end

      test 'should update company' do
        patch api_v1_company_url(@company), params: { company: { name: 'Updated Company' } }
        assert_response :success
        @company.reload
        assert_equal 'Updated Company', @company.name
      end

      test 'should destroy company' do
        assert_difference -> { Company.count(:id) }, -1 do
          delete api_v1_company_url(@company)
        end

        assert_response :no_content
      end
    end
  end
end
