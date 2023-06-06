class Question < ApplicationRecord
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :description
  has_one_attached :file

  def file_key
    "#{self.user.name}/#{file.filename}"
  end
end
