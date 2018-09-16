class CreateResumeCareerSummaries < ActiveRecord::Migration[5.2]
  def change
    create_table :resume_career_summaries do |t|
      t.integer :resume_id
      t.string  :position
      t.string  :company_name
      t.string  :address
      t.text    :body
      t.date    :started
      t.date    :finished

      t.timestamps
    end
  end
end
