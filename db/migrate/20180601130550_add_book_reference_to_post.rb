class AddBookReferenceToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :book, index: true
  end
end
