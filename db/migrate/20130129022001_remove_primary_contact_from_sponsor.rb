class RemovePrimaryContactFromSponsor < ActiveRecord::Migration
  def change
    remove_column :sponsors, :primary_contact
  end
end
