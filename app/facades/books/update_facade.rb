module Books
  class UpdateFacade < BaseFacade
    def run
      save
      super
    end

  end
end