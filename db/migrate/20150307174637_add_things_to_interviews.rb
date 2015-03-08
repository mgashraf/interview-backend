class AddThingsToInterviews < ActiveRecord::Migration
  def change
    remove_column :interviews, :company_id
    remove_column :interviews, :contact_id
    add_column :interviews, :interviewtype, :string
    add_column :interviews, :interviewed, :boolean, default: :false
    add_column :interviews, :notes, :text
    add_column :interviews, :status, :string
  end
end
