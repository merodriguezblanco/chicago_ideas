class AddMenloPassesTiketsToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :menlo_passes_tickets, :integer
  end
end
