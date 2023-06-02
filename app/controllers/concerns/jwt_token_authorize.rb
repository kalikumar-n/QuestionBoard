require 'jwt'
module JwtTokenAuthorize
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.credentials.jwt_secret_key

  def encode(payload, exp = 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end