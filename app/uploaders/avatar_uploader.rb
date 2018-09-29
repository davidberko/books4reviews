class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # Choose what kind of storage to use for this uploader:
  include CarrierWave::MiniMagick
  storage :file

  process resize_to_fit: [500,500]

  version :small do
    process resize_to_fill: [200, 200]
  end

  version :medium do

      # change the word 'fit' to 'fill'
      process resize_to_fill: [400,600]
  end

  version :large do
    process resize_to_fill: [1000,1000]
  end

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
