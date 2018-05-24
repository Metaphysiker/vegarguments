class Argument < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged

  include PgSearch

  belongs_to :question, optional: true

  pg_search_scope :basic_search_for,
                  :against => [:argument, :title, :author],
                  using: { tsearch: { any_word: true, prefix: true } }


  include PgSearch

  multisearchable :against => [:argument, :title, :author],
                  :if => lambda { |record| record.published == true }

  scope :published, -> { where(published: true) }

  def question
    parent.question
  end

  def parent
    Question.find(self.question_id)
  end

end
