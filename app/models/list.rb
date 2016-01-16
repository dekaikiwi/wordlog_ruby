class List < ActiveRecord::Base
  validates :title, :user_id,presence: true

  has_and_belongs_to_many :words
  belongs_to :user
end
