class CreateRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :recordings do |t|
      t.references :context, foreign_key: true
      t.references :creator, foreign_key: true

      t.timestamps
    end
  end
end
