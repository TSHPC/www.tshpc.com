class AddUserToActivityDomains < ActiveRecord::Migration[5.2]
  def change
    add_reference :activity_domains, :user, foreign_key: true
  end
end
