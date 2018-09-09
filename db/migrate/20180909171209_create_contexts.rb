class CreateContexts < ActiveRecord::Migration[5.2]
  def change
    create_table :contexts do |t|
      t.string :name

      t.timestamps
    end
  end
end
