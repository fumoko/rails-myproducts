class AddReleasesToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :release, :string
  end
end
