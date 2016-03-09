class Todos < Base
  resource :todos do
    before do
      authenticate!
    end

    desc 'user todos'
    get :index do
      present current_user.todos
    end
  end
end

