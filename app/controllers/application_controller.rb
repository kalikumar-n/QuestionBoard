class ApplicationController < ActionController::Base
  include JwtTokenAuthorize
  before_action :authenticate_user
  def authenticate_user
    token      = request.headers['Authorization']&.split(' ')&.last
    begin
      decoded  = decode(token)
      @current_user = User.find(decoded['user_id'])
    rescue => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
