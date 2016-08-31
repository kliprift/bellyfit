class Booking < ActiveRecord::Base
  belongs_to :facility
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :facility, presence: true

end
