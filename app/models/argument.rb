class Argument < ApplicationRecord
  include PgSearch

  extend FriendlyId
  friendly_id :question, use: :slugged

  has_many :arguments

  pg_search_scope :basic_argument_search_for,
                  :against => [:question, :quickanswer, :longanswer],
                  using: { tsearch: { any_word: true, prefix: true } }

  scope :published, -> { where(published: true) }


  def should_generate_new_friendly_id?
    slug.blank? || question_changed?
  end



end
