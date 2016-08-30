

class Facility < ActiveRecord::Base
	has_many :bookings
	validates :user_id, presence: true
	belongs_to :user

	# geocoded_by :address
	# after_validation :geocode, if: :address_changed?

	# validates :start_date, presence: true
	# validates :end_date, presence: true
	# validates :private, presence: true
	# validates :title, presence: true
	# validates :notes, presence: true
	# validates :total, presence: true
	validates :sport, presence: true
	mount_uploaders :avatars, AvatarUploader
end
