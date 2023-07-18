# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class ApplicantsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @applicant = create(:applicant)
      end

      test 'should get index' do
        get api_v1_applicants_url
        assert_response :success
      end

      test 'should get index page by page' do
        create_list(:applicant, 5)
        per_page = 4

        # 1st request
        get api_v1_applicants_url(page: 1, per_page: per_page)
        assert_response :success
        assert_equal response.parsed_body.count, per_page

        # 2nd request
        get api_v1_applicants_url(page: 2, per_page: per_page)
        assert_response :success
        assert_equal response.parsed_body.count, Applicant.count - per_page
      end

      test 'should show applicant' do
        get api_v1_applicant_url(@applicant)
        assert_response :success
      end

      test 'should create applicant' do
        assert_difference -> { Applicant.count(:id) }, +1 do
          post api_v1_applicants_url,
               params: { applicant: { first_name: 'John', last_name: 'Doe',
                                      culture_type_id: create(:culture_type).id } }
        end

        assert_response :created
      end

      test 'should update applicant' do
        patch api_v1_applicant_url(@applicant), params: { applicant: { first_name: 'Updated John' } }
        assert_response :success
        @applicant.reload
        assert_equal 'Updated John', @applicant.first_name
      end

      test 'should destroy applicant' do
        assert_difference -> { Applicant.count(:id) }, -1 do
          delete api_v1_applicant_url(@applicant)
        end

        assert_response :no_content
      end
    end
  end
end
