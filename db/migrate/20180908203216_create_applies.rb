class CreateApplies < ActiveRecord::Migration[5.2]
  def change
    create_table :applies do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
    add_foreign_key :applies, :users
    add_foreign_key :applies, :posts
  end
end
