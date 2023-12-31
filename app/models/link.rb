class Link < ApplicationRecord
  belongs_to :user, optional: true
  has_many :views, dependent: :destroy

  scope :recent_first, -> { order(created_at: :desc) }

  validates :url, presence: true

  after_save_commit if: :url_previously_changed? do
    MetadataLinkJob.perform_later(to_param)
  end

  def self.find_by_short_code(id)
    find ShortCode.decode(id)
  end

  def to_param
    ShortCode.encode(id)
  end

  def domain
    URI(url).host rescue URI::InvalidURIError
  end

  def editable_by?(user)
    user_id? && (user_id == user&.id)
  end
end
