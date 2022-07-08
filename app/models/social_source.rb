class SocialSource < ApplicationRecord
	belongs_to :sourceable, polymorphic: true
end
