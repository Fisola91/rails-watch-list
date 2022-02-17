class ListsController < ApplicationController
  def index
    # lists of all
    @lists = List.all
  end

  # GET "lists/1"
  def show
    @list = List.find(params[:id])
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
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path(@bookmark.list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
