class AuthenticationController < ApplicationController

  include JwtTokenAuthorize
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token       = encode({user_id: @user.id, user_email: @user.email})
      expire_time = 1.days.from_now
      render json: {token: token, expire_time: expire_time}, status: :ok
    else
      render json: {error: 'unauthorized'}, status: :unauthorized
    end
  end

end