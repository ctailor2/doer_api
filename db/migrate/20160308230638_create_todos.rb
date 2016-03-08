class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references  :user,      null: false
      t.string      :task,      null: false
      t.timestamps              null: false
    end

    add_index :todos, :user_id
    add_foreign_key :todos, :users
  end
end
