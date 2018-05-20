class Argument < ApplicationRecord
  extend FriendlyId
  friendly_id :question, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || question_changed?
  end

  scope :published, -> { where(published: true) }

end
