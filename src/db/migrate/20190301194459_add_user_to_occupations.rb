class AddUserToOccupations < ActiveRecord::Migration[5.2]
  def change
    add_reference :occupations, :user, foreign_key: true
  end
end
