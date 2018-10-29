class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.bigint :sender_id
      t.bigint :recipient_id
      t.string :sender_name
      t.text :content
      t.timestamps
    end
  end
end
