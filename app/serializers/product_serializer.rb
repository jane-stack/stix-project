class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image
  has_many :categories
end
