class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :cover
  has_many_attached :images
end
