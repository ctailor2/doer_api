class CreateSettingGoals < ActiveRecord::Migration
  def change
    create_table :setting_goals do |t|
      t.references :user,   null: false
      t.integer    :target, null: false, default: 2
      t.timestamps          null: false
    end

    add_index :setting_goals, :user_id
    add_foreign_key :setting_goals, :users
  end
end
