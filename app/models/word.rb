class Word < ActiveRecord::Base
  validates :target_word, :user_id, presence: true

  belongs_to :user
end
