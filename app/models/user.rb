class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_secure_password

  scope :active, -> {where(active: true)}
end
