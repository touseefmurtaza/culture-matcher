# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApplicationController
      before_action :set_company, only: %i[show update destroy]

      # GET /api/v1/companies
      def index
        @companies = Company.paginate(page: page, per_page: per_page)
        render json: @companies
      end

      # GET /api/v1/companies/1
      def show
        render json: @company, include: :matched_applicants
      end

      # POST /api/v1/companies
      def create
        @company = Company.new(company_params)

        if @company.save
          render json: @company, status: :created
        else
          render json: @company.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/companies/1
      def update
        if @company.update(company_params)
          render json: @company
        else
          render json: @company.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/companies/1
      def destroy
        @company.destroy
      end

      private

      def set_company
        @company = Company.find(params[:id])
      end

      def company_params
        params.require(:company).permit(:name, :culture_type_id)
      end
    end
  end
end
