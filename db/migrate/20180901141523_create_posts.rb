class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :url
      t.text :job_type
      t.boolean :remote_ok
      t.string :location
      t.string :job_author
      t.string :image

      t.timestamps
    end
    add_foreign_key :posts, :users
  end
end
