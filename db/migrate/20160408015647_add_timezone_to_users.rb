class AddTimezoneToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :timezone, null: false, default: 'Etc/UTC'
    end
  end
end
