class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :detail, :image, :usable, :tag_id

  def tag_name
    object.tag.name
  end
end
