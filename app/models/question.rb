class Question < ApplicationRecord

  extend FriendlyId
  friendly_id :question, use: :slugged

  has_many :arguments
end
