class AddLockedToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :locked, :boolean, default: true
  end
end
