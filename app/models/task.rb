class Task < ActiveRecord::Base
	default_scope  { order(:position => :asc) }
	belongs_to :project
  has_many :comments, dependent: :destroy
	validates :title, :deadline, presence: true
end
