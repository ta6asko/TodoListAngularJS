class Project < ActiveRecord::Base
  default_scope  { order(:created_at => :asc) }
  
  has_many :tasks, dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
                    length: { maximum: 50 }
end
