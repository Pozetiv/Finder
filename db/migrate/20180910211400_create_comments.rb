class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string  :commentable_type
      t.integer :commentable_id
      t.text    :body, null: false

      t.timestamps
    end

    add_foreign_key :comments, :users
  end
end
