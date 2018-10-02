class Book < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  has_many :reviews
  has_and_belongs_to_many :genres, dependent: :destroy
  has_and_belongs_to_many :claims, join_table: :books_users, association_foreign_key: :user_id, class_name: User.to_s
end
