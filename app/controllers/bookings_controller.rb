class BookingsController < ApplicationController
  before_action :require_login

  def index
    @booking = Booking.all
  end

  def show
    @booking = Booking.find([:facility_id])
  end

  def new
    # @facility = Facility.find(params[:facility_id])
    @booking = current_user.bookings.new(booking_params)

  end

  def create
    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  def edit
    @booking = current_user(booking_params)
  end

  def update
     if @booking.update(booking_params)
      redirect_to @booking
    else
      render 'edit'
  end

  def destroy
    current_user.bookings.destroy
    redirect_to user_bookings_path
  end

  private 

   def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price_perhour, :total, :private, :title, :notes, :facility_id)
  end

end
