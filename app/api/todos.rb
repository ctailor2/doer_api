class Todos < Base
  resource :todos do
    before do
      authenticate!
    end

    desc 'todos list'
    get :index do
      present current_user.todos
    end

    desc 'create todo'
    params do
      requires :todo, type: Hash do
        requires :task, type: String
      end
    end
    post :create do
      present current_user.todos.create!(declared(params).todo)
    end
  end
end

