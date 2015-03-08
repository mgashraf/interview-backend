class AddUserIdToTextResume < ActiveRecord::Migration
  def change
    add_column :text_resumes, :user_id, :integer
  end
end
