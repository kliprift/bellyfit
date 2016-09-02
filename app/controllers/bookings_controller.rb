class BookingsController < ApplicationController
  before_action :require_login
  
  before_action :find_facility, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def search_bookings
        @bookings = Booking.search(params[:term], fields: ["title", "notes", "facility_location_name"], mispellings: {below: 5})
        if @bookings.blank?
          redirect_to root_path, flash:{danger: "no successful search result"}
        else
          render :index
        end
  end

  def update
    
    @booking = Booking.find(params[:id])
    @booking.participant_id << current_user.id
    @booking.save
    redirect_to facility_booking_path(@booking.facility.id, @booking.id), notice: "You've joined this booking."
  end
  
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = @facility.bookings.new
  end


  def create
    
    a = start_date
    b = end_date
    @price = @facility.price_per_hour

    @booking = @facility.bookings.new(booking_params)
    @booking.start_date = a
    @booking.end_date = b
    @hours = (@booking.end_date - @booking.start_date)/3600

    @total = @hours * @price
    @booking.total = @total
    @booking.user_id = current_user.id
    @booking.facility_location_name = @facility.location_name

    if @booking.save 
      redirect_to facility_booking_path(@facility, @booking), notice: "Booking has been successfully created"
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

  #  def find_facility_for_new
  #   byebug
  #   @facility = Facility.find(params[:facility_id])
  # end

end


