class ApplicationController < ActionController::Base
  include Pagy::Backend

  rescue_from Pagy::OverflowError do
    redirect_to root_path
  end

  private

  def set_link
    @link = Link.find_by_short_code params[:link_id] || params[:id]
  end

  def check_if_editable
    unless @link.editable_by?(current_user)
      redirect_to @link, alert: "You aren't allowed to do that."
    end
  end
end
