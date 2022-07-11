module Authors
  class DestroyFacade < BaseFacade
    def run
      author.destroy
      super
    end

  end
end