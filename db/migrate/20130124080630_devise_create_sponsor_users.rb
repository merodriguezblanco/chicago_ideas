class DeviseCreateSponsorUsers < ActiveRecord::Migration
  def change
    create_table(:sponsor_users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
      
      t.integer :sponsor
      t.string :title
      t.string :phone
      t.boolean :newsletters_subscription
      t.boolean :primary_contact
      
      t.timestamps
    end

    add_index :sponsor_users, :email,                :unique => true
    add_index :sponsor_users, :reset_password_token, :unique => true
    # add_index :sponsor_users, :confirmation_token,   :unique => true
    # add_index :sponsor_users, :unlock_token,         :unique => true
    # add_index :sponsor_users, :authentication_token, :unique => true
  end

end
