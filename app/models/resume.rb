class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :listings

  has_attached_file :document 
  validates_attachment_content_type :attachment, { content_type: ['application/msword', 
                                                                  'application/vnd.openxmlformats-officedocument.wordprocessingml.document'] }
end
