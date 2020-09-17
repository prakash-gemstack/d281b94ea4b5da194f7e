class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :answers
  validates :question, uniqueness: true, presence: true
end
