# frozen_string_literal: true

module Api
  module V1
    class CultureTypesController < ApplicationController
      before_action :set_culture_type, only: %i[show update destroy]

      def index
        @culture_types = CultureType.paginate(page: page, per_page: per_page)
        render json: @culture_types
      end

      def show
        render json: @culture_type
      end

      def create
        @culture_type = CultureType.new(culture_type_params)

        if @culture_type.save
          render json: @culture_type, status: :created
        else
          render json: @culture_type.errors, status: :unprocessable_entity
        end
      end

      def update
        if @culture_type.update(culture_type_params)
          render json: @culture_type
        else
          render json: @culture_type.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @culture_type.destroy
      end

      private

      def set_culture_type
        @culture_type = CultureType.find(params[:id])
      end

      def culture_type_params
        params.require(:culture_type).permit(:name)
      end
    end
  end
end
