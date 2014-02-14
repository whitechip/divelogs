class Divelog < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	geocoded_by :point
    after_validation :geocode
end
