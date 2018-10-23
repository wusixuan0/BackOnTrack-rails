class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
