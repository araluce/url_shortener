class DetailsController < ApplicationController
  before_action :set_link, only: :show
  before_action :check_if_editable, only: :show

  def show
    @view = @link.views.find(params[:id])
  end
end
