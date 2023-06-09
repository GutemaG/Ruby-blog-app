class Api::ApplicationController < ActionController::API
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    respond_with '{"error": "not_found"}', status: :not_found
  end
end
