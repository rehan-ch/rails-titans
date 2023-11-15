class CreateContactFormInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_form_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :content
      t.timestamps
    end
  end
end
