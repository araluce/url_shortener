class View < ApplicationRecord
  belongs_to :link, counter_cache: true

  after_save_commit :udate_metadata

  def udate_metadata
    return if persisted? && !ip_previously_changed? && !user_agent_previously_changed?

    MetadataViewJob.perform_later(id)
  end
end
