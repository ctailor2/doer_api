class CreateSessionTokens < ActiveRecord::Migration
  def change
    create_table :session_tokens do |t|
      t.references :user,       null: false
      t.string     :token,      null: false
      t.datetime   :expires_at, null: false
      t.timestamps              null: false
    end

    add_index :session_tokens, :user_id
    add_index :session_tokens, :token, unique: true
    add_foreign_key :session_tokens, :users
  end
end
