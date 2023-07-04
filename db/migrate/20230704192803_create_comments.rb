class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.references :author, null: false

      t.timestamps
    end
    add_index :comments, :title
    add_index :comments, :body
  end
end
