class CreateNutritions < ActiveRecord::Migration[5.2]
  def change
    create_table :nutritions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.float :quantity
      t.float :serving_size
      t.float :calories
      t.float :carbohydrates
      t.float :protein
      t.float :fat

      t.timestamps
    end
  end
end
