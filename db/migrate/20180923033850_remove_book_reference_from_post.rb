class RemoveBookReferenceFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :book, index: true
  end
end
