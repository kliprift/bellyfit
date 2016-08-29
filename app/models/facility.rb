class Facility < ActiveRecord::Base
	has_many :bookings
	validates :user_id, presence: true
	belongs_to :user
end
