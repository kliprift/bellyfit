class Facility < ActiveRecord::Base
	has_many :bookings, presence: true
	validates :user, presence: true
	validates :date, presence: true
end
