# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApplicationController
      before_action :set_company, only: %i[show update destroy]

      def index
        @companies = Company.paginate(page: page, per_page: per_page)
        render_company(@companies)
      end

      def show
        render json: @company, include: :matched_applicants
      end

      def create
        @company = Company.new(company_params)

        if @company.save
          render_company(@company, status: :created)
        else
          render_exception(@company.errors)
        end
      end

      def update
        if @company.update(company_params)
          render_company(@company)
        else
          render_exception(@company.errors)
        end
      end

      def destroy
        render_exception(@company.errors) unless @company.destroy
      end

      private

      def set_company
        @company = Company.find(params[:id])
      end

      def company_params
        params.require(:company).permit(:name, :culture_type_id)
      end

      def render_company(company, status: :ok)
        render json: company,
               status: status
      end
    end
  end
end
