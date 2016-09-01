class Booking < ActiveRecord::Base
  has_many :payments
  belongs_to :facility
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :facility, presence: true

end
