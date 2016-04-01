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
        requires :active, type: Boolean
      end
    end
    post :create do
      present current_user.todos.create!(declared(params).todo)
    end

    route_param :id do
      desc 'update todo'
      params do
        requires :todo, type: Hash do
          optional :completed, type: Boolean
          optional :position, type: Integer
        end
      end
      put do
        todo = current_user.todos.find(params[:id])
        present todo.update_attributes!(declared(params).todo)
      end

      desc 'destroy todo'
      delete do
        present current_user.todos.find(params[:id]).destroy
      end
    end
  end
end

