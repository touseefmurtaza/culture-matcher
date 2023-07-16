# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class CultureTypesControllerTest < ActionDispatch::IntegrationTest
      setup do
        @culture_type = create(:culture_type)
      end

      test 'should get index' do
        get api_v1_culture_types_url
        assert_response :success
      end

      test 'should show culture_type' do
        get api_v1_culture_type_url(@culture_type)
        assert_response :success
      end

      test 'should create culture_type' do
        assert_difference -> { CultureType.count(:id) }, +1 do
          post api_v1_culture_types_url, params: { culture_type: { name: 'New Culture Type' } }
        end

        assert_response :created
      end

      test 'should update culture_type' do
        patch api_v1_culture_type_url(@culture_type), params: { culture_type: { name: 'Updated Culture Type' } }
        assert_response :success
        @culture_type.reload
        assert_equal 'Updated Culture Type', @culture_type.name
      end

      test 'should destroy culture_type' do
        assert_difference -> { CultureType.count(:id) }, -1 do
          delete api_v1_culture_type_url(@culture_type)
        end

        assert_response :no_content
      end
    end
  end
end
