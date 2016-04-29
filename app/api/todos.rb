class Todos < Base
  resource :todos do
    before do
      authenticate!
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

    desc 'bulk update todos'
    params do
      requires :todos_attributes, type: Array do
        requires :id, type: Integer
        optional :position, type: Integer
        optional :active, type: Boolean
      end
    end
    put :bulk_update do
      present current_user.update_attributes!(declared(params))
    end

    route_param :id do
      desc 'update todo'
      params do
        requires :todo, type: Hash do
          optional :completed, type: Boolean
          optional :position, type: Integer
          optional :active, type: Boolean
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

