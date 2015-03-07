class AddColumnResume < ActiveRecord::Migration
  def change
    add_attachment :resumes, :file_name
  end
end
