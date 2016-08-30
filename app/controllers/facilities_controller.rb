class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update]
  
  def index
    @facilities = current_user.facilities
  end

  def show
    @photos = @facility.photos
  end

  def new
    @facility = current_user.facilities.build
  end

  def create
    @facility = current_user.facilities.build(facility_params)

    if @facility.save
      if params[:images]
        params[:images].each do |image|
          @facility.photo.create(image: image)
        end
      end

      @photos = @facility.photos
      redirect_to edit_facility_path(@facility), notice: "Facility is successfully created"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @facility.user.id
      @photos = @facility.photos
    else
      redirect_to root_path, notice: "You don't have access permission."
    end
  end

  def update
    if @facility.update(room_params)

      if params[:images]
        params[:images].each do |image|
          @facility.photo.create(image: image)
        end
      end

      redirect_to edit_facility_path(@facility), notice: "Facility is successfully updated."
    else
      render :edit
    end
  end

  private

    def set_facility
      @facility = Facility.find(current_user.id)
    end

    def facility_params
      params.require(:facility).permit(:street, :city, :state, :type, :start_time, :end_time, :description, :location_name, :ratings, :price_per_hour)
    end
end






