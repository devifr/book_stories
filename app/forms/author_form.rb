class AuthorForm < Reform::Form
  property :name
  property :bio
  property :gender
  property :total_book
  property :summary
  property :born
  property :died

  validates :name, :bio, presence: true

end
