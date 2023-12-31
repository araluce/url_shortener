class LinksController < ApplicationController
  before_action :set_link, only: %i[show edit update destroy]
  before_action :check_if_editable, only: %i[edit update destroy]

  def index
    @pagy, @links = pagy Link.recent_first
    @link  ||= Link.new
  end

  def show
  end

  def create
    @link = Link.new(link_params.with_defaults(user: current_user))
    @link.user = current_user
    if @link.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Link created successfully." }
        format.turbo_stream { render turbo_stream: turbo_stream.prepend("links", @link) }
      end
    else
      index
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: "Link edited successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path, notice: "Link has been deleted."
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
