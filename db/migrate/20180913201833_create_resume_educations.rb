class CreateResumeEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :resume_educations do |t|
      t.integer :resume_id, nul: false
      t.date    :started
      t.date    :finished
      t.string  :academy_name
      t.string  :profession
      t.text    :body

      t.timestamps
    end

    remove_column :users, :first_name, :string
    remove_column :users, :last_name,  :string
    add_foreign_key :resume_educations, :resumes
  end
end
