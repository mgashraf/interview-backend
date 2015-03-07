class Interview < ActiveRecord::Base
  belongs_to :user, :listing
end
