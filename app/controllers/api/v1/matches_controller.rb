# frozen_string_literal: true

module Api
  module V1
    class MatchesController < ApplicationController
      before_action :set_match, only: %i[show destroy]

      # GET /api/v1/matches
      def index
        @matches = Match.all
        render json: @matches
      end

      # GET /api/v1/matches/1
      def show
        render json: @match
      end

      # POST /api/v1/matches
      def create
        @match = Match.new(match_params)

        if @match.save
          render json: @match, status: :created
        else
          render json: @match.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/matches/1
      def destroy
        @match.destroy
      end

      private

      def set_match
        @match = Match.find(params[:id])
      end

      def match_params
        params.require(:match).permit(:applicant_id, :company_id)
      end
    end
  end
end
