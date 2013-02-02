class RenameMenloPassesTicket < ActiveRecord::Migration
  def up
    rename_column :sponsors, :menlo_passes_tickets, :menlo_passes
  end

  def down
  end
end
