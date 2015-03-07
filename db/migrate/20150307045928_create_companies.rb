class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :zipcode
      t.integer :state
      t.string :phone_number
      t.string :url
      t.string :hr_email
      t.timestamps null: false
    end
  end
end
