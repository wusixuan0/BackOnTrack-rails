class CreateTestings < ActiveRecord::Migration[5.2]
  def change
    create_table :testings do |t|
      t.text :message

      t.timestamps
    end
  end
end
