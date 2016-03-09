module Auth
  CLIENT_TOKEN_HEADER  = 'Client-Token'
  SESSION_TOKEN_HEADER = 'Session-Token'

  def authorize!
    error!('401 Unauthorized', 401) unless client_token
  end

  def authenticate!
    error!('401 Unauthorized', 401) unless session_token
  end

  def session_token_header
    headers[SESSION_TOKEN_HEADER]
  end

  def session_token
    return false unless session_token_header
    SessionToken.find_by_token(session_token_header)
  end

  def current_user
    session_token.user
  end

  def client_token_header
    headers[CLIENT_TOKEN_HEADER]
  end

  def client_token
    return false unless client_token_header
    ClientToken.find_by_token(client_token_header)
  end
end
