class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :dogs
  has_many :bookings
  has_many :kennels
  has_many :kennel_photos

  mount_uploader :avatar, AvatarUploader

  def get_active_bookings
    @bookings = self.bookings.map do |booking|
      booking if booking.active
    end
  end

  def get_inactive_bookings
    @bookings = self.bookings.map do |booking|
      booking unless booking.active
    end
  end

end
