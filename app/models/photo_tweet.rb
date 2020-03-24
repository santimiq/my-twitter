class PhotoTweet < ApplicationRecord
  has_attached_file :image,
  :styles => {
      :thumb => "100x100#"}

  validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "iamge/gif", "image/png"]},
    size: { in: 0..10.megabytes },
    presence: true
end
