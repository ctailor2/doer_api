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

    desc 'update todo positions'
    params do
      requires :todos_attributes, type: Array do
        requires :id, type: Integer
        requires :position, type: Integer
      end
    end
    put :update_positions do
      current_user.update_attributes(declared(params))
      present current_user.todos
    end

    route_param :id do
      desc 'destroy todo'
      delete do
        present current_user.todos.find(params[:id]).destroy
      end
    end
  end
end

