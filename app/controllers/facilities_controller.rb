class FacilitiesController < ApplicationController
  before_action :set_facility
  
  def index
    @facilities = current_user.facilities
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
