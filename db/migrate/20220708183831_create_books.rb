class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :original_title
      t.integer :year
      t.references :author, null: false, foreign_key: true
      t.text :plot
      t.string :copyright
      t.string :title
      t.float :average_rating
      t.integer :rating_count
      t.string :similiar_book_ids
      t.text :description
      t.string :loc_class
      t.integer :pages
      t.string :language
      t.string :isbn13
      t.datetime :release_date
      t.text :summary
      t.boolean :content_cleaned
      t.boolean :content_available

      t.timestamps
    end
  end
end
