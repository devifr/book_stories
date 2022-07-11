module Authors
  class CreateFacade < BaseFacade
    def run
      save
      super
    end
  end
end