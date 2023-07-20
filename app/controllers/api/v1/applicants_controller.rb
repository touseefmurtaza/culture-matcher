# frozen_string_literal: true

module Api
  module V1
    class ApplicantsController < ApplicationController
      before_action :set_applicant, only: %i[show update destroy]

      def index
        @applicants = Applicant.paginate(page: page, per_page: per_page)
        render json: @applicants
      end

      def show
        render json: @applicant
      end

      def create
        @applicant = Applicant.new(applicant_params)

        if @applicant.save
          render json: @applicant, status: :created
        else
          render json: @applicant.errors, status: :unprocessable_entity
        end
      end

      def update
        if @applicant.update(applicant_params)
          render json: @applicant
        else
          render json: @applicant.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @applicant.destroy
      end

      private

      def set_applicant
        @applicant = Applicant.find(params[:id])
      end

      def applicant_params
        params.require(:applicant).permit(:first_name, :last_name, :culture_type_id)
      end
    end
  end
end
