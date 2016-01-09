class Word < ActiveRecord::Base
  validates :target_word, :user_id, presence: true

  has_and_belongs_to_many :lists
  belongs_to :user
end
