class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_secure_password
  validates :email, presence: :true, uniqueness: :true
  validates_presence_of :name
  scope :active, -> {where(active: true)}
end
