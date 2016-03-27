class AddActiveToTodos < ActiveRecord::Migration
  def change
    change_table :todos do |t|
      t.boolean :active, null: false, default: false
    end
  end
end
