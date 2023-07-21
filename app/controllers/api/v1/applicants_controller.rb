# frozen_string_literal: true

module Api
  module V1
    class ApplicantsController < ApplicationController
      before_action :set_applicant, only: %i[show update destroy]

      def index
        @applicants = Applicant.paginate(page: page, per_page: per_page)
        render_applicant(@applicants)
      end

      def show
        render_applicant(@applicant)
      end

      def create
        @applicant = Applicant.new(applicant_params)

        if @applicant.save
          render_applicant(@applicant, status: :created)
        else
          render_exception(@applicant.errors)
        end
      end

      def update
        if @applicant.update(applicant_params)
          render_applicant(@applicant)
        else
          render_exception(@applicant.errors)
        end
      end

      def destroy
        render_exception(@applicant.errors) unless @applicant.destroy
      end

      private

      def set_applicant
        @applicant = Applicant.find(params[:id])
      end

      def applicant_params
        params.require(:applicant).permit(:first_name, :last_name, :culture_type_id)
      end

      def render_applicant(culture_type, status: :ok)
        render json: culture_type,
               status: status
      end
    end
  end
end
