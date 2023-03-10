class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review).all
  end

  def show
    @review = Review.find(params[:id])
    authorize @review
  end

  def new
    @item = Item.find(params[:item_id])
    @booking = @item.bookings.find(params[:booking_id])
    @review = @booking.reviews.new
    authorize @booking
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = @item.bookings.find(params[:booking_id])
    @review = @booking.reviews.new(review_params)
    @review.user = current_user

    authorize @booking

    if @review.save
      redirect_to item_path(@item), notice: "Review added successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment).merge(item_id: params[:item_id])
  end
end
