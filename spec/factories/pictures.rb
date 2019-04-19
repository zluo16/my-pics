require 'ffaker'

FactoryBot.define do
  factory :picture do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    url { FFaker::Image.url }
    thumbnail_url { FFaker::Image.url }
  end
end
