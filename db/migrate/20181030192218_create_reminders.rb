class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.references :doctor, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
