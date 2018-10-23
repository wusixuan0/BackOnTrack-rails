class CreateTodoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_lists do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
