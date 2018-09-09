class CreateRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :recordings do |t|
      t.references :context, foreign_key: true
      t.integer :creator_id, foreign_key: true

      t.timestamps
    end
  end
end
