class Resume::Education < ApplicationRecord
  belongs_to :resume, class_name: 'Resume'

  validates :started,      presence: true
  validates :academy_name, presence: true
  validates :profession,   presence: true
  validates :body,         length: { minimum: 10 }, allow_blank: true

  validates_with ValidDateValidator if :finished?
end
