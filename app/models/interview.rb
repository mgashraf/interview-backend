class Interview < ActiveRecord::Base
  belongs_to :user
  has_one :listing
end
