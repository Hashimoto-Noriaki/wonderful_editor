class Api::V1::ArticlePreviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :updated_at
  belongs_to :user, serializer: Api::V1::UserSerializer
  # has_many  :comments,:user
end

# rails  g migration   add_カラム名_to_テーブル名　カラム名：型
