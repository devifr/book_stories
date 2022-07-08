class CreateSocialSources < ActiveRecord::Migration[6.0]
  def change
    create_table :social_sources do |t|
      t.integer :sourceable_id
      t.string :sourceable_type
      t.string :url
      t.boolean :found
      t.string :type_source
      t.integer :year
      t.integer :num

      t.timestamps
    end
  end
end
