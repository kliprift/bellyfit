class BookingsController < ApplicationController
  before_action :require_login
  before_action :find_user, only: [:show, :edit, :update]

  def index
  end

  def show
  end

  def new
  end

  def create
    @booking = current_user.bookings.create(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  def edit
    if current_user.bookings.update(booking_params)
      redirect_to @booking
    else
      render 'edit'
  end

  def update
  end

  def destroy
    current_user.bookings.destroy
    redirect_to user_bookings_path
  end

  private 

  def find_user
    @user = User.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :total, :private, :title, :notes, :facility)
  end

end
