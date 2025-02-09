# frozen_string_literal: true

# test/controllers/api/v1/matches_controller_test.rb
require 'test_helper'

module Api
  module V1
    class MatchesControllerTest < ActionDispatch::IntegrationTest
      setup do
        @match = create(:match)
      end

      test 'should get index' do
        get api_v1_matches_url
        assert_response :success
      end

      test 'should get index page by page' do
        create_list(:match, 5)
        per_page = 4

        # 1st request
        get api_v1_matches_url(page: 1, per_page: per_page)
        assert_response :success
        assert_equal response.parsed_body.count, per_page

        # 2nd request
        get api_v1_matches_url(page: 2, per_page: per_page)
        assert_response :success
        assert_equal response.parsed_body.count, Match.count - per_page
      end

      test 'should show match' do
        get api_v1_match_url(@match)
        assert_response :success
      end

      test 'should create match' do
        assert_difference -> { Match.count(:id) }, +1 do
          post api_v1_matches_url,
               params: { match: { applicant_id: create(:applicant).id, company_id: create(:company).id } }
        end

        assert_response :created
      end

      test 'should not create match when applicant_id is nil' do
        assert_no_difference -> { Match.count(:id) } do
          post api_v1_matches_url, params: { match: { applicant_id: nil, company_id: @match.company_id } }
        end

        assert_response :unprocessable_entity
        assert_includes response.parsed_body['error']['applicant'], 'must exist'
      end

      test 'should not create match when company_id is nil' do
        assert_no_difference -> { Match.count(:id) } do
          post api_v1_matches_url, params: { match: { applicant_id: create(:applicant).id, company_id: nil } }
        end

        assert_response :unprocessable_entity
        assert_includes response.parsed_body['error']['company'], 'must exist'
      end

      test 'should destroy match' do
        assert_difference -> { Match.count(:id) }, -1 do
          delete api_v1_match_url(@match)
        end

        assert_response :no_content
      end
    end
  end
end
