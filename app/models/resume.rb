class Resume < ApplicationRecord
  belongs_to :user
  has_many :career_summaries, inverse_of: :resume, dependent: :destroy, class_name: 'Resume::CareerSummary'
  has_many :educations,       inverse_of: :resume, dependent: :destroy, class_name: 'Resume::Education'

  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :career_summaries, reject_if: :all_blank, allow_destroy: true

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name,  presence: true, length: { minimum: 2 }
  validates :position,   presence: true, length: { minimum: 2 }
  validates :location,   presence: true, length: { minimum: 2 }
  validates :email,      presence: true, length: { minimum: 3 }
  validates :telefon,    presence: true, length: { minimum: 5 }, allow_blank: true
  validates :body,       presence: true, length: { minimum: 2 }, allow_blank: true
  validates :linked_in,  presence: true, length: { minimum: 2 }, allow_blank: true

  mount_uploader :photo, ResumeUploader
end
