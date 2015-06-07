class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :title
      t.string :imdb_id
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
