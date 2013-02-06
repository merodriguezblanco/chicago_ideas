class AddPdfToCooperativeApplications < ActiveRecord::Migration
  def change
    add_attachment :cooperative_applications, :pdf
  end
end
