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
      session_token = user.session_tokens.active.last || user.session_tokens.create!
      present session_token
    end
  end
end

