class AddPositionToTodos < ActiveRecord::Migration
  def change
    change_table :todos do |t|
      t.integer :position, null: false
    end
  end
end
