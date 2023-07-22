# frozen_string_literal: true

module Api
  module V1
    class MatchesController < ApplicationController
      before_action :set_match, only: %i[show destroy]

      def index
        @matches = Match.paginate(page: page, per_page: per_page)
        render_match(@matches)
      end

      def show
        render_match(@match)
      end

      def create
        ActiveRecord::Base.transaction do
          @match = Match.new(match_params)

          if @match.save
            render_match(@match, status: :created)
          else
            render_exception(@match.errors)
          end
        end
      end

      def destroy
        render_exception(@match.errors) unless @match.destroy
      end

      private

      def set_match
        @match = Match.find(params[:id])
      end

      def match_params
        params.require(:match).permit(:applicant_id, :company_id)
      end

      def render_match(match, status: :ok)
        render json: match,
               status: status
      end
    end
  end
end
