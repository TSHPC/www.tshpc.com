class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :location
      t.datetime :starts_at
      t.datetime :ends_at
      t.decimal :price
      t.decimal :discounted_price

      t.timestamps
    end
  end
end
