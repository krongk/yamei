class Album < ActiveRecord::Base
  has_many :album_photos
  validates_presence_of :title
end
