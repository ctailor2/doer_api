class CreateSettingPipelines < ActiveRecord::Migration
  def change
    create_table :setting_pipelines do |t|
      t.references :user,               null: false
      t.integer    :days_between_views, null: false, default: 2
      t.timestamps                      null: false
    end

    add_index :setting_pipelines, :user_id
    add_foreign_key :setting_pipelines, :users
  end
end
