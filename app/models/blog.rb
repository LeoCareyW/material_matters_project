class Blog < ApplicationRecord
  has_many_attached :photos
  belongs_to :user

  has_attached_file :mp3
  validates_attachment :mp3, :content_type => { :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ] }
end



