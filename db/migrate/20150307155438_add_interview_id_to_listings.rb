class AddInterviewIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :interview_id, :integer
  end
end
