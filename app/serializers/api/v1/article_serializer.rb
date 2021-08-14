class Api::V1::ArticlePreviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :udated_at
  #  render json: title, body,updated_at
  # has_many  :comments,:user
end
