class AddUserToGatherings < ActiveRecord::Migration[6.0]
  def change
    add_reference :gatherings, :user, foreign_key: true
  end
end
