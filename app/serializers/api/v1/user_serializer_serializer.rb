class Api::V1::UserSerializerSerializer < ActiveModel::Serializer
  attributes :id, :name,:email
end
