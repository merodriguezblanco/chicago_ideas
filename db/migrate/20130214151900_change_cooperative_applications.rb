class ChangeCooperativeApplications < ActiveRecord::Migration
  def up
    add_column :cooperative_applications,     :last_name,   :string, null: false
    add_column :cooperative_applications,     :email,       :string, null: false
    add_column :cooperative_applications,     :org_website, :string, null: false
    add_column :cooperative_applications,     :passion_1,   :string
    add_column :cooperative_applications,     :passion_2,   :string
    add_column :cooperative_applications,     :passion_3,   :string
    change_column :cooperative_applications,  :org_mission, :text
    remove_column :cooperative_applications,  :passion
    remove_column :cooperative_applications,  :expectations
  end

  def down
    remove_column :cooperative_applications, :last_name
    remove_column :cooperative_applications, :email
    remove_column :cooperative_applications, :org_website
    remove_column :cooperative_applications, :passion_1
    remove_column :cooperative_applications, :passion_2
    remove_column :cooperative_applications, :passion_3
    change_column :cooperative_applications, :org_mission, :string
    add_column :cooperative_applications,    :passion, :string
    add_column :cooperative_applications,    :expectations, :string
  end
end
