class AddPolymorphicColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :postable_id, :integer
    add_column :posts, :postable_type, :string
    add_index :posts, [:postable_id, :postable_type]
  end
end
