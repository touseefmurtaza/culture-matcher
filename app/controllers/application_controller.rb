# frozen_string_literal: true

class ApplicationController < ActionController::API
  DEFAULT_PER_PAGE = 10

  # Pagination params
  def page
    (params[:page].presence || 1).to_i
  end

  def per_page
    (params[:per_page] || DEFAULT_PER_PAGE).to_i
  end
end
