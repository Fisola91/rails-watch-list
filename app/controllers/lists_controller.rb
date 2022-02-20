class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  def index
    # lists of all
    @lists = List.all
  end

  # GET "lists/1"
  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  # GET "lists/new"
  def new
    @list = List.new
  end

  # POST/ list
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path(@bookmark.list)
  end

  private

  # Only allow a trusted parameter "white list" through.
  def list_params
    params.require(:list).permit(:name)
  end

  # This uses callback to share common setup or constriants between action
  def set_list
    @list = List.find(params[:id])
  end
end
