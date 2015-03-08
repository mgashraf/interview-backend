class RemoveEmailFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :email
  end
end
