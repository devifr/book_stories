module Books
  class DestroyFacade < BaseFacade
    def run
      book.destroy
      super
    end

  end
end