class Book < ApplicationRecord
  belongs_to :author
  has_many :social_sources, as: :sourceable

  scope :last_update, -> { order(updated_at: :desc) }
  
  has_one_attached :cover
  has_many_attached :images

  def self.search(params)
    search = self
    search = search.where(author_id: params[:author_id]) if params[:author_id].present?
    search = search.where(year: params[:year]) if params[:year].present?
    search = search.where("page >= ?",params[:from_page]) if params[:from_page].present?
    search = search.where("page <= ?",params[:to_page]) if params[:to_page].present?
    search
  end
end
