class Supplement < ActiveRecord::Base
  
  before_destroy :destroy_file

  belongs_to :comment
  validates :comment_id, presence: true
  
  mount_uploader :file, FileUploader

  private

  def destroy_file
    self.remove_file!
    self.save
  end
end
