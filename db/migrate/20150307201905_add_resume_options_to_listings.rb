class AddResumeOptionsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :submitted_resume, :boolean, default: false
    add_column :listings, :date_resume_submitted, :datetime
    add_column :listings, :opportunity_ranking, :integer, default: 0
    add_column :listings, :opportunity_description, :text
    add_column :listings, :company_summary, :text
    add_column :listings, :lead_source, :string
  end
end
