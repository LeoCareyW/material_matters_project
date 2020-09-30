class AddContentMainToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :contentMain, :text
  end
end
