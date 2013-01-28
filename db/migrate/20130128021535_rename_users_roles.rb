class RenameUsersRoles < ActiveRecord::Migration
  def change
    rename_column :users, :speaker, :is_speaker
    rename_column :users, :volunteer, :is_volunteer
    add_column :users, :is_sponsor, :boolean
    add_column :users, :is_member, :boolean
  end
end
