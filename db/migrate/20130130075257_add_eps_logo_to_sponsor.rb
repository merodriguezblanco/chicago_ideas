class AddEpsLogoToSponsor < ActiveRecord::Migration
  def change
    add_attachment :sponsors, :eps_logo
  end
end
