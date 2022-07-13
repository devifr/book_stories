class BookForm < Reform::Form
  property :isbn
  property :original_title
  property :year
  property :author_id
  property :plot
  property :copyright
  property :title
  property :description
  property :pages
  property :language
  property :isbn13
  property :release_date
  property :summary
  property :content_cleaned
  property :content_available

  validates :title, :author_id, presence: true

end
