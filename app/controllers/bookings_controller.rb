class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  # the Booking Show page is not necessary
  def show
  end

  def new
    @booking = @item.bookings.new
  end

  def create
    @booking = @item.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to item_bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = @item.bookings.find(params[:id])
  end

  def update
    @booking = @item.bookings.find(params[:id])

    if @booking.update(booking_params)
      redirect_to item_bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = @item.bookings.destroy(params[:id])
    redirect_to item_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @item = Item.find(params[:item_id])
  end

end
