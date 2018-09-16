class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.integer :user_id
      t.string  :first_name
      t.string  :last_name
      t.string  :position
      t.string  :location
      t.integer :telefon
      t.string  :email
      t.text    :body
      t.string  :linked_in
      t.string  :photo

      t.timestamps
    end
    add_foreign_key :resumes, :users
    add_foreign_key :resume_career_summaries, :resumes, column: :resume_id
  end
end
