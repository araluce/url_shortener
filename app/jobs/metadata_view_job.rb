class MetadataViewJob < ApplicationJob
  def perform(id)
    view = View.find(id)
    view.update Metadata::View.retrieve_from(view.user_agent).attributes
  end
end
