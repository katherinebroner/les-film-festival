class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    @drama = Category.find_by(title: "Drama")
    @comedy = Category.find_by(title: "Comedy")
    @thriller = Category.find_by(title: "Thriller/Horror")
    @musical = Category.find_by(title: "Musical")
    @action = Category.find_by(title: "Action/Adventure")
    @documentary = Category.find_by(title: "Documentary")
  end

  def new
    if !logged_in?
      redirect_to root_path
    else
      @review = Review.new
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])

    if current_user != @review.user
      redirect_to movie_path(@review.movie)
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.movie = Movie.find_by(id: params[:movie_id])

    if @review.save
      redirect_to movie_path(@review.movie)
    else
      render 'new'
    end
  end

  def update
    review = Review.find_by(id: params[:id])

    if review.update(review_params)
      redirect_to movie_path(review.movie)
    else
      render 'edit'
    end
  end

  def destroy
    review = Review.find_by(id: params[:id])

    review.destroy

    redirect_to movie_path(review.movie)

  end

  private
  def review_params
    params.require(:review).permit(:description, :stars)
  end
end