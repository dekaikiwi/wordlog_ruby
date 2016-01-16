class WordSerializer < ActiveModel::Serializer
  attributes :id, :target_word, :translation

  has_one :user
end
