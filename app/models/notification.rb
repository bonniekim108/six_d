class Notification < ActiveRecord::Base
  #attr_accessible :content, :user_id, :document_attributes # this part allows us to say status.document
  belongs_to :user
  #belongs_to :document
  #accepts_nested_attributes_for :document
  default_scope -> { order(created_at: :desc) } # ensures that most recent notification is first 
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size # custom validation so use validate instead of validation

  private

    # Validates size of uploaded picture
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
