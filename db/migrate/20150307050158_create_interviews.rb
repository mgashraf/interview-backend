class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :company_id
      t.integer :contact_id
      t.integer :user_id
      t.string :position_title
      t.string :follow_up_email
      t.datetime :interview_time
      t.timestamps null: false
    end
  end
end
