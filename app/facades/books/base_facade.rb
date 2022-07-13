module Books
  class BaseFacade
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def run
      {
        book: book,
        books: books,
        authors: authors,
        years: years,
        form: form
      }
    end

    private

    def book
      @book ||=  params[:id].blank? ? Book.new : Book.find(params[:id])
    end

    def books
      @books = Book.includes(:author).search(params).last_update.paginate(page: params[:page])
    end

    def authors
      @authors = Author.all.pluck(:name, :id)
    end

    def years
      @years = (1887..2022).to_a
    end

    def save
      book.cover.attach(book_params[:cover]) if book_params[:cover].present?
      form.save if form.validate(book_params)
    end

    def form
      @form ||= BookForm.new(book)
    end

    def book_params
      params[:book]
    end

  end
end
