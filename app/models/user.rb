class User < ApplicationRecord
mount_uploader :avatar, AvatarUploader


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :reviews , dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id

  enum access_level: [:author, :reviewer, :moderator]

  has_and_belongs_to_many :claims, join_table: :books_users, association_foreign_key: :book_id, class_name: Book.to_s

def self.search(search)
  where("concat_ws(' ', first_name, last_name) ILIKE ?", "%#{search.squish}%")
end

def full_name
  first_name + " " + last_name
end

def score
  self.reviews.where(helpful: true)
end

def initialize(array)
  @array = array
end

def count_increases
  @array = self.reviews.size
  if @array += 1
    self.increment!(:ranking, 2)
  end
end
end
