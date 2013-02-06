class CreateCooperativeApplications < ActiveRecord::Migration
  def change
    create_table :cooperative_applications do |t|
      t.string :name
      t.string :title
      t.string :organization
      t.string :phone
      t.string :org_mission
      t.string :org_twitter
      t.text :reason
      t.text :worked_on
      t.text :expectations
      t.text :part_meaningful
      t.text :ins_failure
      t.text :neighborhood
      t.text :assisted_area
      t.text :passion
      t.text :recommend
      t.timestamps
    end
  end
end
