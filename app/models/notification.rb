class Notification < ActiveRecord::Base

  #belongs_to :document
  #accepts_nested_attributes_for :document
  # mount_uploader :picture, PictureUploader

  belongs_to :user
  default_scope -> { order(created_at: :desc) } # ensures that most recent notification is first 
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size # custom validation so use validate instead of validation
  field :body

  private

#     # Validates size of uploaded picture
#     def picture_size
#       if picture.size > 5.megabytes
#         errors.add(:picture, "should be less than 5MB")
#       end
#     end
# end
