class Post < ApplicationRecord
  extend FriendlyId

  default_scope { order(created_at: :desc) }
  scope :by_job_type, -> (params)   { where( "job_type = ?", params ) if params.present? }
  scope :by_location, -> (location) { where( "location LIKE ?", "%#{location}" ) if location.present? }
  scope :by_title,    -> (title)    { where( "title LIKE ?", "%#{title}%" ) if title.present? }
  scope :by_remote,   -> (status)   { where( "remote_ok = ?", status ) if status.present? }
  # Ex:- scope :active, -> {where(:active => true)}

  validates :title,       presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 2 }
  validates :url,         length: { minimum: 2 }, allow_blank: true
  validates :job_type,    presence: true, inclusion: { in: ["Full-Time", "Part-Time", "Contract", "Freelance"] }
  validates :location,    presence: true, length: { minimum: 2 }


  belongs_to :user
  has_many :applies

  mount_uploader :image, ImageUploader

  friendly_id :title

  JOB_TYPES = ["Full-Time", "Part-Time", "Contract", "Freelance"]

  def self.search(params)
    self.by_job_type(params[:job_type]).by_location(params[:text_field])
        .by_title(params[:text_field]).by_remote(params[:remote_ok])
  end
end
