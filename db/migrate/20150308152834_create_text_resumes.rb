class CreateTextResumes < ActiveRecord::Migration
  def change
    create_table :text_resumes do |t|
      t.string :name
      t.string :age
      t.string :location
      t.string :jobtitle
      t.string :experience
      t.string :education
      t.string :date

      t.timestamps null: false
    end
  end
end
