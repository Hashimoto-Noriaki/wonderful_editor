class Api::V1::ArticlePreviewSerializerSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :udated_at
   render json: title,body,updated_at
  has_many  :comments,:user
  
end