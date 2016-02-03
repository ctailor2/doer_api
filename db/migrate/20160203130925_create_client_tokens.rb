class CreateClientTokens < ActiveRecord::Migration
  def change
    create_table :client_tokens do |t|
      t.string    :label,   null: false
      t.string    :token,   null: false
      t.boolean   :active,  null: false, default: true
      t.timestamps          null: false
    end

    add_index :client_tokens, :token, unique: true
  end
end
