class Argument < ApplicationRecord

  validates :argument, presence: true

   before_save :sanitize_url

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
  scope :unpublished, -> { where(published: false) }

  def question
    parent.question
  end

  def parent
    Question.find(self.question_id)
  end

  private
  def sanitize_url
    self.url = "http://#{self.url}" unless self.url =~ /^https?:\/\//
  end

end
