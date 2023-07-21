# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  DEFAULT_PER_PAGE = 25
  DEFAULT_PAGE = 1

  protected

  # Pagination params
  def page
    (params[:page].presence || DEFAULT_PAGE).to_i
  end

  def per_page
    (params[:per_page] || DEFAULT_PER_PAGE).to_i
  end

  private

  def render_not_found
    render_exception('Not found', status: :not_found)
  end

  def render_exception(message, status: :unprocessable_entity, **other)
    render status: status, json: { error: message, **other }
  end
end
