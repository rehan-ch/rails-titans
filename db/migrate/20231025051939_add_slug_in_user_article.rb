class AddSlugInUserArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :slug, :string, :unique =>  true
    add_column :articles, :slug, :string, :unique =>  true
  end
end
