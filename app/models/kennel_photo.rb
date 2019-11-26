class KennelPhoto < ApplicationRecord
  belongs_to :kennel
  belongs_to :user

  mount_uploader :photo, PhotoUploader

end
