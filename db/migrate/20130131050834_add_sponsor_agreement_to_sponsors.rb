class AddSponsorAgreementToSponsors < ActiveRecord::Migration
  def change
    add_attachment :sponsors, :sponsor_agreement
  end
end
