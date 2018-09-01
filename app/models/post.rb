class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 2 }
  validates :url, presence: true, length: { minimum: 2 }
  validates :job_type, presence: true, inclusion: { in: ["Full-Time", "Part-Time", "Contract", "Freelance"] }
  validates :location, presence: true, length: { minimum: 2 }
  validates :url, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader

 JOB_TYPES = ["Full-Time", "Part-Time", "Contract", "Freelance"]
end
