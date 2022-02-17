class BookmarksController < ApplicationController

  def new
    @new = Bookmark.new
  end

  def create
    # A list_id is needed to create a bookmark(comment)
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "lists/show"
    end
  end

    def bookmark_params
      params.require(:list).permit(:comment)
    end
end
