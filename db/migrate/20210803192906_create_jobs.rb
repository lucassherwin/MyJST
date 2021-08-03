class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :status
      t.string :contact
      t.integer :user_id

      t.timestamps
    end
  end
end
