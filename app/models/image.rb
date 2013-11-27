class Image < ActiveRecord::Base
	belongs_to :listing
	mount_uploader :image, ImageUploader
	# this is the load:
	require 'base64'

	File.open('ruby.png', 'r') do|image_file|
	  puts Base64.encode64(image_file.read)
	end
end
