class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :recordable, polymorphic: true
      t.references :recordable_previous, polymorphic: true, index: {name: "index_events_on_recordable_previous"}
      t.references :context, foreign_key: true
      t.integer :creator_id, foreign_key: true
      t.string :action

      t.timestamps
    end
  end
end
