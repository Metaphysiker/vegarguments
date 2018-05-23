class Argument < ApplicationRecord
  include PgSearch

  belongs_to :question

  pg_search_scope :basic_argument_search_for,
                  :against => [:argument],
                  using: { tsearch: { any_word: true, prefix: true } }

  scope :published, -> { where(published: true) }


  def should_generate_new_friendly_id?
    slug.blank? || question_changed?
  end

end
