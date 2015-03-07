class AddListingToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :listing_id, :integer
  end
end
