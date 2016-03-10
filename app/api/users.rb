class Users < Base
  resource :users do
    desc 'user registration'
    params do
      requires :user, type: Hash do
        requires :email, type: String
        requires :password, type: String
        requires :password_confirmation, type: String
      end
    end
    post :signup do
      user = User.create!(declared(params).user)
      present user.session_tokens.create!
    end

    desc 'user registration'
    params do
      requires :user, type: Hash do
        requires :email, type: String
        requires :password, type: String
      end
    end
    post :login do
      user = User.find_by_email!(declared(params).user.email)
      if user.authenticate(declared(params).user.password)
        session_token = user.session_tokens.active.last || user.session_tokens.create!
        present session_token
      else
        # Need to handle this scenario more elegantly
        error!('500 Fatal Error', 500)
      end
    end
  end
end

