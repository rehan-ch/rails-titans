# frozen_string_literal: true

# create comments table
class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :parent, foreign_key: { to_table: :comments }
      t.references :article
      t.references :user
      t.timestamps
    end
  end
end
