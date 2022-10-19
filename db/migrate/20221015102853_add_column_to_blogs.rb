class AddColumnToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :user_uid, :string
  end
end
