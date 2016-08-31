class PhotosController < ApplicationController

	def edit
		@photos = @facility.photos
	end


	def destroy
		@photo = Photo.find(params[:id])
		facility = @photo.facility

		@photo.destroy
		@photos = Photo.where(facility_id: facility.id)

		respond_to :js
	end
end