class Resume::CareerSummary < ApplicationRecord
  belongs_to :resume, class_name: "Resume"

  validates :position,     presence: true
  validates :company_name, presence: true
  validates :address,      presence: true
  validates :body,         presence: true
  validates :started,      presence: true

  validates_with ValidDateValidator if :finished?
end
