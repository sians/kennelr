class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :vet, optional: true
  has_many :bookings

  mount_uploader :picture, PictureUploader

  def get_active_bookings
    self.bookings.map do |booking|
      booking if booking.active
    end
  end

  def get_inactive_bookings
    self.bookings.map do |bookings|
      booking unless booking.active
    end
  end

end
