class AddCheckListIdToListing < ActiveRecord::Migration
  def change
    add_column :listings, :checklist_id, :integer
  end
end
