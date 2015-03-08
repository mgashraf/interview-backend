class AddUserInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :age, :integer
    add_column :users, :experience, :text
    add_column :users, :skills, :text
    add_column :users, :education, :text
  end
end
