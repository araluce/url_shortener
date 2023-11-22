class View < ApplicationRecord
  belongs_to :link, counter_cache: true

  after_save_commit -> { MetadataViewJob.perform_later(id) }
end
