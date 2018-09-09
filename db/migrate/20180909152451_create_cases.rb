class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
      t.string :name
      t.integer :status
      t.text :content

      t.timestamps
    end
  end
end
