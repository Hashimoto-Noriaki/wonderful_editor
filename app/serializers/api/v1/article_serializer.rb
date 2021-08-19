class Api::V1::ArticlePreviewSerializerSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :updated_at
  belongs_to :users, serializer: Api::V1::Userserializer
end
