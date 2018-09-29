class Book < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :user
  has_and_belongs_to_many :genres

end
