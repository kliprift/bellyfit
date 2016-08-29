class Facility < ActiveRecord::Base
	has_many :bookings
	validates :user_id, presence: true
end
