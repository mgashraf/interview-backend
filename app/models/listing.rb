class Listing < ActiveRecord::Base
  belongs_to :company, :user
  has_many :interviews
end
