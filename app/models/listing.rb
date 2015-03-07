class Listing < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :interviews
end
