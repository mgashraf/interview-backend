class Listing < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :interview
end
