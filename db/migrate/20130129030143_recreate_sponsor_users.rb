class RecreateSponsorUsers < ActiveRecord::Migration
  def change
    drop_table :sponsor_users
    create_table(:sponsor_users) do |t|
      t.integer :sponsor_id
      t.integer :user_id
      t.string :title
      t.string :phone
      t.boolean :newsletters_subscription
      t.boolean :primary_contact
      t.attachment :sponsor_agreement
      t.boolean :sponsor_agreement_signed

      t.timestamps
    end
    remove_attachment :users, :sponsor_agreement
    remove_column :users, :sponsor_agreement_signed
  end

end
