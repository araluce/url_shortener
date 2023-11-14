class ApplicationController < ActionController::Base
  private

  def set_link
    @link = Link.find params[:id]
  end
end
