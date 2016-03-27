class AddCompletedToTodos < ActiveRecord::Migration
  def change
    change_table :todos do |t|
      t.boolean :completed, null: false, default: false
    end
  end
end
