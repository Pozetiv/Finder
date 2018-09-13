class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # before_save :user_aplies

  ##TODO check apply-user
  def user_aplies

    binding.pry

  end
end
