class CreateBoardsPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :boards_posts do |t|
      t.references :board, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
