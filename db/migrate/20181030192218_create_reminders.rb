class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.bigint :doctor_id
      t.bigint :client_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
