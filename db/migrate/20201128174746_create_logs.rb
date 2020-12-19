class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :cond_id
      t.string :problem
      t.integer :tech_id

      t.timestamps
    end
  end
end
