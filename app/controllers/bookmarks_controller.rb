class BookmarksController < ApplicationController
  before_action :set_list, only: :create
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # A list_id is needed to create a bookmark(comment)
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "lists/show"
    end
  end

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end

    def set_list
      @list = List.find(params[:list_id])
    end
end
