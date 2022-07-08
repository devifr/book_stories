class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio
      t.integer :gender
      t.integer :total_book
      t.text :summary
      t.datetime :born
      t.datetime :died

      t.timestamps
    end
  end
end
