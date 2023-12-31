# frozen_string_literal: true

# create articles table
class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.references :user
      t.timestamps
    end
  end
end
