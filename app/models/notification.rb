class Notification < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) } # ensures that most recent notification is first 
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size

  private

    # Validates size of uploaded picture
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
