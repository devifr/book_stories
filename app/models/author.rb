class Author < ApplicationRecord
  scope :last_update, -> { order(updated_at: :desc) }
	has_many :books
	has_many :social_sources, as: :sourceable

  validates_presence_of :name

	enum gender: [:m, :f]

end
