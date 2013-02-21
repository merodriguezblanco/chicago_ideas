class AddProjectedMembersAndMaxMembersToMemberTypes < ActiveRecord::Migration
  def change
    add_column :member_types, :projected_members, :integer, default: 0
    add_column :member_types, :maximum_members, :integer, default: 0
  end
end
