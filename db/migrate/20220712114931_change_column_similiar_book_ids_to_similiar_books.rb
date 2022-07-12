class ChangeColumnSimiliarBookIdsToSimiliarBooks < ActiveRecord::Migration[6.0]
  def change
    rename_column(:books, :similiar_book_ids, :similiar_books)
    change_column(:books, :similiar_books, :string)
  end
end
