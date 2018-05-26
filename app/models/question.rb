class Question < ApplicationRecord

  validates :question, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :question, use: :slugged



  has_many :arguments

  include PgSearch

  pg_search_scope :basic_search_for,
                  :against => [:question],
                  using: { tsearch: { any_word: true, prefix: true } }

  multisearchable :against => [:question]

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
  scope :without_arguments, -> { left_outer_joins(:arguments).where(arguments: { id: nil }) }
  scope :fewer_arguments_than, -> (count) { select{ |q| q.arguments.length < count} }

  def should_generate_new_friendly_id?
    slug.blank? || question_changed?
  end
end
