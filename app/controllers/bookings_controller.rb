class BookingsController < ApplicationController
  # before_action :set_booking, only: [:new, :create, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).all
    %w[pending accepted declined cancelled].each do |status|
      instance_variable_set("@#{status}_bookings_count", policy_scope(Booking).send(status).count)
    end
    booking_ids = @bookings.pluck(:item_id)
    @items = []
    booking_ids.each { |id| @items << Item.find(id) }
    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude
        #info_window: render_to_string(partial: "popup", locals: {item: item})
      }
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
      ItemMailer.booking(@item.user, @booking).deliver_now
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

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update status: 'accepted'
    redirect_to bookings_path
  end

  def decline
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update status: 'declined'
    redirect_to bookings_path
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
