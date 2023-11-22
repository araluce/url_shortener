class View < ApplicationRecord
  belongs_to :link, counter_cache: true

  after_save_commit if: :user_agent_changed? do
    MetadataViewJob.perform_later(id)
  end
end
