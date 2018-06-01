class CreatePostsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_tags, :id => false do |t|
      t.references :post, foreign_key: true, index: true
      t.references :tag, foreign_key: true, index: true
    end
  end
end
