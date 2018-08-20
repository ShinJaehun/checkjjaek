class AddColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :contents, :text
    add_column :books, :url, :text
    add_column :books, :date_time, :string
    add_column :books, :translators, :string
    add_column :books, :category, :string
  end
end
