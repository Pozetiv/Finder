class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :applies
  has_many :comments, as: :commentable
  has_one  :resume, dependent: :destroy

  mount_uploader :image, AvatarUploader
end
