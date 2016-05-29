class Users < Base
  resource :users do
    before do
      authenticate!
    end

    desc 'user show'
    params do
      optional :with_assocs, type: Array[String]
    end
    get :show do
      present current_user, { with: User::Entity }.merge(params)
    end

    desc 'user update'
    params do
      requires :user, type: Hash do
        optional :timezone, type: String
        optional :goal_setting_attributes, type: Hash do
          requires :target, type: Integer
        end
      end
    end
    put :update do
      present current_user.update_attributes!(declared(params).user)
    end
  end
end

