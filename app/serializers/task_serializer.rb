class TaskSerializer < ActiveModel::Serializer
  attributes :position, :id, :title, :completed, :deadline, :project_id
  has_many :comments
end
