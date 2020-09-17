class Topic < ApplicationRecord
  has_many :questions
  has_many :users, through: :topic_follwers
  has_many :topic_follwers
  validates :topic, uniqueness: true, presence: true
end
