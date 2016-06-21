class CommentsController < ApplicationController

  def new
    if !logged_in?
      redirect_to root_path
    else
      if request.xhr?
        @comment = Comment.new
        render partial: "comment_form", layout: false, locals: { comment: @comment }
      else
        @comment = Comment.new
      end
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])

    if current_user != @comment.user
      redirect_to movie_path(@comment.review.movie)
    end

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.review = Review.find_by(id: params[:review_id])

    if @comment.save
      if request.xhr?
        render partial: "movies/movie_comment_info", layout: false, locals: { comment: @comment }
      else
        redirect_to movie_path(@comment.review.movie)
      end
    else
      render 'new'
    end

  end

  def update
    comment = Comment.find_by(id: params[:id])

    if comment.update(comment_params)
      redirect_to movie_path(comment.review.movie)
    else
      render 'edit'
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])

    comment.destroy

    if request.xhr?
      render partial: "comment_delete", layout: false
    else
      redirect_to movie_path(comment.review.movie)
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
