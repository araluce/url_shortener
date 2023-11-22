class ApplicationController < ActionController::Base
  private

  def set_link
    @link = Link.find_by_short_code params[:id]
  end
end
