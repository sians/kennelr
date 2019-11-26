class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :vet, optional: true
  has_many :bookings

  mount_uploader :picture, PictureUploader

  def get_active_bookings
    @bookings = self.bookings.map do |booking|
      booking if booking.active
    end
    @bookings.reject { |item| item.nil? || item == '' }

  end

  def get_inactive_bookings
    @bookings = self.bookings.map do |bookings|
      booking unless booking.active
    end
    @bookings.reject { |item| item.nil? || item == '' }
  end

end
