module Authors
  class UpdateFacade < BaseFacade
    def run
      save
      super
    end

  end
end