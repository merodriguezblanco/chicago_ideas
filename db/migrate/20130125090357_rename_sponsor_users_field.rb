class RenameSponsorUsersField < ActiveRecord::Migration
  def up
    rename_column :sponsor_users, :sponsor, :sponsor_id
  end

  def down
  end
end
