class User < ApplicationRecord
mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
  enum access_level: [:author, :reviewer]

  has_and_belongs_to_many :claims, join_table: :books_users, association_foreign_key: :book_id, class_name: Book.to_s
end
