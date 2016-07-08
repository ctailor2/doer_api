class AddLastViewedAtToSettingPipelines < ActiveRecord::Migration
  def change
    change_table :setting_pipelines do |t|
      t.datetime :last_viewed_at
    end
  end
end
