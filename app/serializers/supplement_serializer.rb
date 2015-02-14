class SupplementSerializer < ActiveModel::Serializer
  attributes :id, :file, :filename, :comment_id

  def filename
    object.file.file.filename if object.file.file
  end
end
