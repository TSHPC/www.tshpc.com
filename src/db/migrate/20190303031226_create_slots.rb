class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.string :title
      t.text :abstract
      t.text :prerequisites
      t.string :location
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
