class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.integer :company_id
      t.integer :contact_id
      t.string :job_title
      t.boolean :applied, default: false
      t.string :contact_email
      t.string :phone_number
      t.string :email
      t.string :posting_url
      t.timestamps null: false
    end
  end
end
