class Api::V1::ArticlePreviewSerializerSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :updated_at
  belongs_to :users, title:,body:,
  # has_many  :comments,:user
end
