class Picture < ApplicationRecord
    mount_uploader :image, ImageUploader
  
    validates :image, presence: true
    validate :validate_file_type
  
    private
  
    def validate_file_type
        puts "Validating file type..."
        return unless image.present? && !image.file.content_type.in?(%w(image/jpeg image/jpg image/png image/gif))
        errors.add(:image, 'Only JPG, JPEG, GIF, and PNG files are allowed')
      end
      
  end
  