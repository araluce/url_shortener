class MetadataViewJob < ApplicationJob
  def perform(id)
    view = View.find(id)
    view.update Metadata::View.retrieve_from(view).attributes
  end
end
