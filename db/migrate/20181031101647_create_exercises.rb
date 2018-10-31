class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.float :duration
      t.float :calories
      t.timestamps
    end
  end
end
