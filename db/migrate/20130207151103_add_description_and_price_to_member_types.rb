class AddDescriptionAndPriceToMemberTypes < ActiveRecord::Migration
  def change
    add_column :member_types, :description, :text
    add_column :member_types, :price_in_cents, :integer, :default => 0
  end
end
