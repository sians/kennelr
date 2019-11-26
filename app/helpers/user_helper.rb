module UserHelper
  def avatar_or_placeholder(user)
    if user.avatar_url.present?
      cl_image_path user.avatar_url
    else
      # asset_url ''
      'https://res.cloudinary.com/djkvtunck/image/upload/v1568216783/j54mfn75mceuggabjkkt.png'
    end
  end
end


# add a photo column to Dog model
# add a Pictures model & associate with dogs
