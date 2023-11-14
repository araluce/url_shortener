class Link < ApplicationRecord
  scope :recent_first, -> { order(created_at: :desc) }

  validates :url, presence: true
  validates :url, uniqueness: true
end
