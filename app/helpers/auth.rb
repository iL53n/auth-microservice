module Auth
  extend self
  # AUTH_TOKEN = %r{\ABearer (?<token>.+)\z}

  def extracted_token(token)
    JwtEncoder.decode(token)
  rescue JWT::DecodeError
    {}
  end

  # private
  #
  # def matched_token
  #   result = auth_header&.match(AUTH_TOKEN)
  #   return if result.blank?
  #
  #   result[:token]
  # end
  #
  # def auth_header
  #   request.env['HTTP_AUTHORIZATION']
  # end
end
