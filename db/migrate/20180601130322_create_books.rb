class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :image
      t.string :isbn
      t.string :publisher
      t.string :author

      t.timestamps
    end
  end
end
