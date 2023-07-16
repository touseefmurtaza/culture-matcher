# frozen_string_literal: true

module Api
  module V1
    class ApplicantsController < ApplicationController
      before_action :set_applicant, only: %i[show update destroy]

      # GET /api/v1/applicants
      def index
        @applicants = Applicant.all
        render json: @applicants
      end

      # GET /api/v1/applicants/1
      def show
        render json: @applicant
      end

      # POST /api/v1/applicants
      def create
        @applicant = Applicant.new(applicant_params)

        if @applicant.save
          render json: @applicant, status: :created
        else
          render json: @applicant.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/applicants/1
      def update
        if @applicant.update(applicant_params)
          render json: @applicant
        else
          render json: @applicant.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/applicants/1
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
