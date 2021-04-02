module Auth
  AUTH_TOKEN = %r{\ABearer (?<token>.+)\z}

  def extracted_token
    JwtEncoder.decode(matched_token)
  rescue JWT::DecodeError
    {}
  end

  def matched_token
    result = auth_header&.match(AUTH_TOKEN)
    return if result.blank?

    result[:token]
  end

  def auth_header
    request.headers['Authorization']
  end
end
