module DogHelper
  def photo_or_placeholder(dog)
    if dog.picture_url.present?
      cl_image_path dog.picture_url
    else
      'http://via.placeholder.com/140x200'
      # 'https://res.cloudinary.com/djkvtunck/image/upload/v1568216783/j54mfn75mceuggabjkkt.png'
    end
  end
end
