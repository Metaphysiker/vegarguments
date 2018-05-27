class Argument < ApplicationRecord

  require 'csv'

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

  def clean_argument
    ActionController::Base.helpers.strip_tags(argument)
  end

  def parent
    Question.find(self.question_id)
  end

  def languagefull
    #Language.find_by_abbreviation(self.language).name
    I18n.t(self.language.to_s)
  end

  def hyperlink
    Rails.configuration.host.to_s + "arguments/" + slug
  end

  def length
    clean_argument.length
  end

  def self.to_csv
  #attributes = %w{question title clean_argument author}
  attributes = [Question.model_name.human, Argument.human_attribute_name("title"), Argument.human_attribute_name("argument"), Argument.human_attribute_name("author"), Argument.human_attribute_name("language")]
    CSV.generate(headers: true) do |csv|
    csv << attributes
      all.each do |argument|
        csv << [argument.question, argument.title, argument.clean_argument, argument.author, I18n.t(argument.language.to_s)]
      end
    end
  end

  private
  def sanitize_url
    if !self.url.blank?
      self.url = "http://#{self.url}" unless self.url =~ /^https?:\/\//
    end
  end

end
