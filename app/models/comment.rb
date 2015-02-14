class Comment < ActiveRecord::Base
  belongs_to :task
  has_many   :supplements
  validates :text, presence: true
end
