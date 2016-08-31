class BookingsController < ApplicationController
  before_action :require_login
  before_action :find_facility, except: [:show]

  def index
    @booking = Booking.all
  end

  def show
  end

  def new
    @booking = @facility.bookings.new
  end


  def create
    a = start_date
    b = end_date
    @booking = @facility.bookings.new(booking_params)
    @booking.user_id = current_user.id
    @booking.start_date = a
    @booking.end_date = b
    
    if @booking.save 
     
      redirect_to facility_booking_path(@booking, @facility.id), notice: "Booking has been successfully created"
    else
      render 'new'
    end
  end

  private 

  def start_date
    start_date_string = params[:start_date]
    return start_date = datify(start_date_string).to_datetime
  end

  def end_date
    end_date_string = params[:end_date]
    return end_date = datify(end_date_string).to_datetime
  end

  def datify(date)
    mth = date[0..2]
    day = date[3..5]
    yr = date[6..9]
    day + mth + yr + date[10..17]
  end

  def booking_params
    params.require(:booking).permit(:private, :title, :notes)
  end

  def find_facility
    @facility = Facility.find(params[:facility_id])
  end

end


