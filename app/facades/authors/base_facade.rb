module Authors
  class BaseFacade
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def run
      {
        author: author,
        authors: authors,
        form: form
      }
    end

    private

    def author
      @author ||=  params[:id].blank? ? Author.new : Author.find(params[:id])
    end

    def authors
      @authors = Author.last_update.paginate(page: params[:page])
    end

    def save
      form.save if form.validate(author_params)
    end

    def form
      @form ||= AuthorForm.new(author)
    end

    def author_params
      params[:author]
    end

  end
end
