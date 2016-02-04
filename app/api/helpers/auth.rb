module Auth
  CLIENT_TOKEN_HEADER  = 'Client-Token'
  SESSION_TOKEN_HEADER = 'Session-Token'

  def authorize!
    error!('401 Unauthorized', 401) unless client_token
  end

  def authenticate!
  end

  def current_user
  end

  def client_token_header
    headers[CLIENT_TOKEN_HEADER]
  end

  def client_token
    return false unless client_token_header
    ClientToken.find_by_token(client_token_header)
  end
end
