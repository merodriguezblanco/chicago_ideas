class Insert2013ToYears < ActiveRecord::Migration
  def up
    if Year.where(id: 2013).blank?
      y = Year.new
      y.id = 2013
      y.save
    end
  end

  def down
  end
end
