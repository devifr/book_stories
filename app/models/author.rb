class Author < ApplicationRecord
	has_many :books
	has_many :social_sources, as: :sourceable

	enum gender: [:m, :f]

end
