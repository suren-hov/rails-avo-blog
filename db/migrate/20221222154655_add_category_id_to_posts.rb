class AddCategoryIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :category, index: false
  end
end
