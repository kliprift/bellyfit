class Booking < ActiveRecord::Base
  belongs_to :facility
  belongs_to :user
  validates :date, presence: true
  validates :facility, presence: true

end
