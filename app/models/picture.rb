class Picture < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true
  validates :thumbnail_url, presence: true

  belongs_to :user
end
