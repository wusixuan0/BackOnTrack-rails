class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :start
      t.date :end
      t.boolean :allday?

      t.timestamps
    end
  end
end
