class AddNewfieldsToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :ciw_talks_tickets, :integer
    add_column :sponsors, :labs_tickets, :integer
    add_column :sponsors, :vip_reception_tickets, :integer
    add_column :sponsors, :edison_talk_tickets, :integer
    add_column :sponsors, :concert_tickets, :integer
    add_column :sponsors, :sponsorship_amount, :decimal
    add_column :sponsors, :primary_contact, :boolean
  end
end
