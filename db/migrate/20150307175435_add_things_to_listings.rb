class AddThingsToListings < ActiveRecord::Migration
  def change
    remove_column :listings, :company_id
    add_column :listings, :company_name, :string
    add_column :listings, :notes, :text
  end
end
