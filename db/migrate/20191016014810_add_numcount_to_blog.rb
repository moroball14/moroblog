class AddNumcountToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :likes_count, :integer
  end
end
