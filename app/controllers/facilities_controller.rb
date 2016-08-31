class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update, :destroy]
  
  def index
    @facilities = current_user.facilities
  end

  def show

  end

  def new
    @facility = current_user.facilities.build
  end

  def create
    @facility = current_user.facilities.new(facility_params)

    if @facility.save
      redirect_to user_facility_path(current_user.id, @facility.id), notice: "Facility is successfully created"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @facility.user.id
      @avatars = @facility.avatars
    else
      redirect_to root_path, notice: "You don't have access permission."
    end
  end

  def update
   
    if @facility.update(facility_params)
      redirect_to user_facility_path(current_user.id, @facility.id), notice: "Facility is successfully updated."
    else
      render :edit
    end
  end

  def destroy

    if @facility.destroy
      redirect_to user_facilities_path(current_user.id), notice: "Facility is deleted."
    else
      render :edit
    end
  end

  private

    def set_facility
      @facility = Facility.find(params[:id])
    end

    def facility_params
      params.require(:facility).permit(:street, :city, :state, :sport, :start_time, :end_time, :description, :location_name, :ratings, :price_per_hour, {avatars: []})
    end
end






