class Question < ApplicationRecord

  extend FriendlyId
  friendly_id :question, use: :slugged

  has_many :arguments

  include PgSearch
  multisearchable :against => [:question]


  def should_generate_new_friendly_id?
    slug.blank? || question_changed?
  end
end
