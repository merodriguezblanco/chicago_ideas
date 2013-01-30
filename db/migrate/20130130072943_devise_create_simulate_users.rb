class DeviseCreateSimulateUsers < ActiveRecord::Migration
  def change
    create_table(:simulate_users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.integer :user_id, :null => false
      t.timestamps
    end

    add_index :simulate_users, :email,                :unique => true
    add_index :simulate_users, :reset_password_token, :unique => true

  end

end

