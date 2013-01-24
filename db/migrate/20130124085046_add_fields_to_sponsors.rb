class AddFieldsToSponsors < ActiveRecord::Migration
  def change
    add_attachment :users, :sponsor_agreement
    add_column :users, :sponsor_agreement_signed, :boolean, default: false
  end
end
