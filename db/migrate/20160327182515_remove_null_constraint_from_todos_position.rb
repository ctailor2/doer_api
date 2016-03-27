class RemoveNullConstraintFromTodosPosition < ActiveRecord::Migration
  def change
    change_column_null :todos, :position, true
  end
end
