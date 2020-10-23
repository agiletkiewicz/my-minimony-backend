class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :image_url
      t.references :user, null: false, foreign_key: true
    end
  end
end
