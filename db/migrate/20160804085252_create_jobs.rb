class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text   :title
      t.string :company
      t.text   :location
      t.text   :job_type
      t.text   :detail
      t.text   :url

      t.timestamps null: false
    end
  end
end
