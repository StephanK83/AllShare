class BookingsController < ApplicationController
  # before_action :set_booking, only: [:new, :create, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).all
    %w[pending accepted declined cancelled].each do |status|
      instance_variable_set("@#{status}_bookings_count", policy_scope(Booking).send(status).count)
    end
  end

  # the Booking Show page is not necessary
  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @item = Item.find(params[:item_id])
    @booking = @item.bookings.new
    authorize @item
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = @item.bookings.new(booking_params)
    @booking.user = current_user

    authorize @item

    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])

    authorize @booking

    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @booking = @item.bookings.destroy(params[:id])

    authorize @item
    redirect_to item_bookings_path, status: :see_other
  end

  def cancel
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update status: 'cancelled'
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  # def set_booking
  #   @item = Item.find(params[:item_id])
  # end

end
