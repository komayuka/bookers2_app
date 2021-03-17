class RemoveBookFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :title, :title
    remove_column :books, :body, :body
  end
end
