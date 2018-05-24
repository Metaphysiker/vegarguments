class Question < ApplicationRecord

  extend FriendlyId
  friendly_id :question, use: :slugged



  has_many :arguments

  include PgSearch

  pg_search_scope :basic_search_for,
                  :against => [:question],
                  using: { tsearch: { any_word: true, prefix: true } }

  multisearchable :against => [:question]


  def should_generate_new_friendly_id?
    slug.blank? || question_changed?
  end
end
