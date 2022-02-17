class BookmarksController < ApplicationController

  def new
    @new = Bookmark.new
  end

  def create
    # A restaurant_id is needed to create a review
    @list = Restaurant.find(params[:list_id])
    @bookmark = Review.new(review_params)
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
