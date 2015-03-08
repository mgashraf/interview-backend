class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.integer :listing_id
      t.string :takeaway
      t.text :conversation
      t.text :whodidyoumeet
      t.string :status
      t.string :contactemail
      t.string :recruiteremail
      t.string :thankyounote

      t.string :research
      t.string :interviewer
      t.string :location
      t.string :businesscards
      t.string :keyfindings
      t.string :interviewtips

      t.timestamps null: false
    end
  end
end
