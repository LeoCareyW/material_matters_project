class AddLinkedinToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :linkedin, :string
  end
end
