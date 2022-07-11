module Books
  class CreateFacade < BaseFacade
    def run
      save
      super
    end
  end
end