class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
    	t.text :action
		t.date :due_date

		#status in Cancelled/Completed/In progress/To do
		t.string :status

		# priority in high/medium/low
		t.string :priority

		# task id to interact with tasklist id
		# t.integer :tasklist_id

		t.references :tasklist, foreign_key: true

		#date&time creation
		t.timestamps

    end
  end
end
